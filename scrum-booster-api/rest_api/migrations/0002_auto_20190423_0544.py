# Generated by Django 2.1.1 on 2019-04-23 05:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rest_api', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cmmipractices',
            name='title',
            field=models.CharField(max_length=255),
        ),
    ]
