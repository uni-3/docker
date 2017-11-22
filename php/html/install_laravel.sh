#! /bin/bash

composer create-project laravel/laravel ${PROJECT_NAME} --prefer-dist
cd ${PROJECT_NAME} && composer install

