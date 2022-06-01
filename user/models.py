from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models


# Create your models here.
class UserModel(models.Model):
    name = models.CharField(max_length=100)
    surname = models.CharField(max_length=100)
    email = models.EmailField()
    phone_number = models.CharField(max_length=15)
    rating = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)])

    class Meta:
        db_table = "Users"
