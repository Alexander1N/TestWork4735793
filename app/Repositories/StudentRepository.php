<?php

namespace App\Repositories;

use App\Models\Student;
use App\Repositories\Interfaces\StudentRepositoryInterface;

class StudentRepository implements StudentRepositoryInterface
{
    public function all()
    {
        return Student::all();
    }

    public function getStudent($id)
    {
        return Student::where('id', $id)->get();
    } 
    
    public function getSearchStudent($name)
    {
        return Student::where('name', 'like', '%' . $name . '%')
                            ->orderBy('name')
                            ->get();
    }

    public function getStudentTeachers($studetnId)
    {
        if (Student::where('id', $studetnId)->count()) {
            return Student::find($studetnId)->teachers;    
        }
        
        return false;
    }    

}