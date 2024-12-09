from django.http import HttpResponse, JsonResponse
from django.db import connection, transaction
from django.shortcuts import render, redirect
from django.forms import formset_factory
from .forms import VerbForm, ConjForm
from random import random

def conjugation(request):
    data = {}
    with connection.cursor() as cursor:
        query = '''
            SELECT
                v.verb_id, v.fr_inf,
                t.tense_id, t.tense_name,
                c.fr_conj
            FROM 
                (SELECT verb_id, fr_inf
                FROM verb
                ORDER BY RAND()
                LIMIT 1) v
            CROSS JOIN
                (SELECT tense_id, tense_name
                FROM tense
                ORDER BY RAND()
                LIMIT 1) t
            JOIN
                conj c
                    ON
                c.verb_id = v.verb_id AND c.tense_id = t.tense_id
            ORDER BY c.subj_id
            LIMIT 8
        '''

        cursor.execute(query)
        rows = cursor.fetchall()
        
        for row in rows:
            print(row)
        
        infinitive = (rows[0][0], rows[0][1])
        tense = (rows[0][2], rows[0][3])     

        data["inf"] = infinitive
        data["tense"] = tense

        all_conjs = [row[4] for row in rows] 

        conj = [all_conjs[0], all_conjs[1], all_conjs[2], all_conjs[4], all_conjs[5], all_conjs[6]]
        
        data["conj"] = conj

    print(data)

    return JsonResponse(data, safe=False)

def dna():
    with connection.cursor() as cursor:
        query = '''
          SELECT 
            n.noun_fr, n.noun_english,
            d.det_fr, dt.det_en,
            a.adj_fr, aj.adj_en,
            aj.bags
          FROM (
            SELECT
              noun_english, noun_fr,
              gender, plural
            FROM noun
            ORDER BY RAND()
            LIMIT 1) AS n
          JOIN det_agr d ON d.gender = n.gender AND d.plural = n.plural
          JOIN determinant dt ON dt.det_id = d.det_id
          JOIN adj_agr a ON a.gender = n.gender AND a.plural = n.plural
          JOIN adj aj ON aj.adj_id = a.adj_id
          ORDER BY RAND()
          LIMIT 1;
          '''
        cursor.execute(query)
        result = cursor.fetchone()

        fr_noun = result[0]
        en_noun = result[1]
        fr_det = result[2]
        en_det = result[3]
        fr_adj = result[4]
        en_adj = result[5]
        bags = result[6]

        print(fr_det)
        print(en_det)
        print(en_adj)
        print("bags:", en_adj[1])

        if bags:
            fr_sent = f"{fr_det} {fr_adj} {fr_noun}"
        else:
            fr_sent = f"{fr_det} {fr_noun} {fr_adj}"

        en_sent = f"{en_det} {en_adj} {en_noun}"

        return [en_sent, fr_sent]

def adv(adv_type):
  with connection.cursor() as cursor:
    query = '''select adv_en, adv_fr from adv a where a.type=%s order by rand() limit 1'''

    cursor.execute(query.replace("\n", " "), [adv_type])
    adverb = cursor.fetchall()[0]
    return adverb

def adj(gender, plural):
  with connection.cursor() as cursor:
    adj = ["", ""]


    query = '''select adj_id, adj_fr from adj_agr a where a.gender=%s and a.plural=%s order by rand() limit 1'''
    cursor.execute(query.replace("\n", " "), [gender, plural])
    adj_agr_data = cursor.fetchall()[0]
    print("adj_fr:", adj_agr_data)

    adj[1] = adj_agr_data[1]


    query = '''select adj_en from adj a where a.adj_id=%s order by rand() limit 1'''
    cursor.execute(query.replace("\n", " "), [adj_agr_data[0]])

    temp = cursor.fetchall()[0]
    adj[0] = temp[0]

    return adj

def inf_verb():
  with connection.cursor() as cursor:
    query = '''
    SELECT
      eng_inf, fr_inf, type
    FROM
      verb v
    WHERE
      v.type!='modal'
    ORDER BY rand()
    LIMIT 1
    '''
    cursor.execute(query.replace("\n", " "))
    result = cursor.fetchone()

    en_sent = result[0]
    fr_sent = result[1]
    verb_type = result[2]

    
    if verb_type == "transitive":
        words = dna()

        en_sent = en_sent + " " + words[0]
        fr_sent = fr_sent + " " + words[1]

    if verb_type == "intransitive":
        words = adv("manner")
        print(words)
        en_sent = en_sent + " " + words[0]
        fr_sent = fr_sent + " " + words[1]

    if verb_type == "state":
        words = [" "," "]
        adverbs = adv("degree")
        adjectives = adj(gender, plural)
        en_sent += " " + adjectives[0]
        fr_sent += " " + adjectives[1]

    return [" " + en_sent, " " + fr_sent]

def sva():
  with connection.cursor() as cursor:
      query = '''
      SELECT 
        s.eng_subj, s.fr_subj,
        c.eng_conj, c.fr_conj,
        v.type, s.gender, s.plurality
      FROM 
        (SELECT subj_id, eng_subj, fr_subj, gender, plurality 
         FROM subj 
         ORDER BY RAND() 
         LIMIT 1) AS s
      CROSS JOIN 
        (SELECT verb_id, type 
         FROM verb
         ORDER BY RAND() 
         LIMIT 1) AS v
      JOIN 
        conj AS c ON c.subj_id = s.subj_id AND c.verb_id = v.verb_id
      ORDER BY RAND()
      LIMIT 1;
      '''
      cursor.execute(query.replace("\n", " "))
      result = cursor.fetchone()
      
      en_subj = result[0]
      fr_subj = result[1]
      eng_conj = result[2]
      fr_conj = result[3]
      verb_type = result[4]
      gender = result[5]
      plural = result[6]

      en_sent = f"{en_subj} {eng_conj}"
      fr_sent = f"{fr_subj} {fr_conj}"

      words = [" "," "]
      
      if verb_type == "transitive":
          words = dna()
          en_sent = en_sent + " " + words[0]
          fr_sent = fr_sent + " " + words[1]

      if verb_type == "intransitive":
          words = adv("manner")
          en_sent = en_sent + " " + words[0]
          fr_sent = fr_sent + " " + words[1]

      if verb_type == "state":
          adjectives = adj(gender, plural)
          en_sent += " " + adjectives[0]
          fr_sent += " " + adjectives[1]


      if verb_type == "modal":
          words = inf_verb()
          print(en_sent, fr_sent)

          en_sent = en_sent + words[0]
          fr_sent = fr_sent + words[1]

      return [en_sent, fr_sent]


def sva_api(request):
  data = {}

  words = sva()

  data["en"] = words[0]
  data["fr"] = words[1]

  return JsonResponse(data, safe=False)

def dna_api(request):
    data = {}

    words = dna()

    data["en"] = words[0]
    data["fr"] = words[1]

    return JsonResponse(data, safe=False)

def index(request):
    return render(request, "index.html")
