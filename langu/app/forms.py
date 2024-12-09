from django import forms

class VerbForm(forms.Form):
    eng_inf = forms.CharField(max_length=100, label='English Infinitive')
    fr_inf = forms.CharField(max_length=100, label='French Infinitive')
    group = forms.IntegerField(label='Verb Group')

class ConjForm(forms.Form):
    subj_id = forms.IntegerField(widget=forms.HiddenInput())
    subj_name = forms.CharField(label='Subject', disabled=True)
    tense_id = forms.IntegerField(widget=forms.HiddenInput())
    tense_name = forms.CharField(label='Tense', disabled=True)
    eng_conj = forms.CharField(label='English Conjugation')
    fr_conj = forms.CharField(label='French Conjugation')

