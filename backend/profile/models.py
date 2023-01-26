from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models


class ProfileModel(models.Model):
    id = models.AutoField(primary_key=True)
    nickname = models.CharField(max_length=100, null=False, blank=False)
    rating = models.FloatField(validators=[MinValueValidator(0.0), MaxValueValidator(5.0)], null=False, blank=False)
    deals_completed = models.IntegerField(null=False, blank=False)
    telegram_alias = models.CharField(max_length=100, null=False, blank=False)
    user = models.ForeignKey(User, verbose_name='User', on_delete=models.CASCADE)

    class Meta:
        db_table = "Profiles"
