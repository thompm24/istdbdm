from django.urls import path
from . import views

urlpatterns = [
   path('', views.index, name="index"),
   path("conjugations/", views.conjugation, name="random_conjugation"),
   path("sva/", views.sva_api, name="sva"),
   path("dna/", views.dna_api, name="dna"),
]
