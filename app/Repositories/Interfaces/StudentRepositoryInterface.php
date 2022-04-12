<?php

namespace App\Repositories\Interfaces;

interface StudentRepositoryInterface
{
    public function all();
    public function getStudent($id);
    public function getSearchStudent($name);
    public function getStudentTeachers($studetnId);
}