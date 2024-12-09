from django.db import models


class Subj(models.Model):
    subj_id = models.AutoField(primary_key=True)
    eng_subj = models.CharField(max_length=50)
    fr_subj = models.CharField(max_length=50)
    gender = models.CharField(max_length=1)

    class Meta:
        db_table = 'subj'
        managed = False

class Tense(models.Model):
    tense_id = models.AutoField(primary_key=True)
    tense_name = models.CharField(max_length=100)

    class Meta:
        db_table = 'tense'
        managed = False

class Verb(models.Model):
    verb_id = models.AutoField(primary_key=True)
    eng_inf = models.CharField(max_length=100)
    fr_inf = models.CharField(max_length=100)
    group = models.PositiveSmallIntegerField()

    class Meta:
        db_table = 'verb'
        managed = False

class Conj(models.Model):
    verb = models.ForeignKey(Verb, on_delete=models.CASCADE)
    subj = models.ForeignKey(Subj, on_delete=models.CASCADE)
    tense = models.ForeignKey(Tense, on_delete=models.CASCADE)
    eng_conj = models.CharField(max_length=100)
    fr_conj = models.CharField(max_length=100)

    class Meta:
        db_table = 'conj'
        managed = False
        unique_together = (('verb', 'subj', 'tense'),)
# Create your models here.
