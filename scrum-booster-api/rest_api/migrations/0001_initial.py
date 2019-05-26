# Generated by Django 2.1.1 on 2019-04-29 16:58

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Ceremony',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, unique=True)),
                ('detail', models.CharField(max_length=2047)),
                ('image', models.URLField()),
            ],
        ),
        migrations.CreateModel(
            name='CMMIPractices',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('strengthens', models.CharField(max_length=2047)),
                ('satisfy', models.CharField(max_length=2047)),
                ('demonstrated', models.CharField(max_length=2047)),
                ('image', models.URLField()),
            ],
        ),
        migrations.CreateModel(
            name='Glossary',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, unique=True)),
                ('detail', models.CharField(max_length=2047)),
                ('image', models.URLField()),
                ('ceremonies_that_contain', models.ManyToManyField(blank=True, to='rest_api.Ceremony')),
            ],
        ),
        migrations.CreateModel(
            name='Phase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, unique=True)),
                ('detail', models.CharField(max_length=2047)),
                ('image', models.URLField()),
            ],
        ),
        migrations.CreateModel(
            name='Problem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255, unique=True)),
                ('detail', models.CharField(max_length=2047)),
                ('image', models.URLField()),
                ('can_be_solved_by', models.ManyToManyField(to='rest_api.Ceremony')),
            ],
        ),
        migrations.CreateModel(
            name='ProcessArea',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=255)),
                ('related_ceremony', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rest_api.Ceremony')),
            ],
        ),
        migrations.AddField(
            model_name='glossary',
            name='problem_that_contain',
            field=models.ManyToManyField(blank=True, to='rest_api.Problem'),
        ),
        migrations.AddField(
            model_name='cmmipractices',
            name='process_area',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rest_api.ProcessArea'),
        ),
        migrations.AddField(
            model_name='ceremony',
            name='phase',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='rest_api.Phase'),
        ),
    ]
