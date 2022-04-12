<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Interfaces\StudentRepositoryInterface;

class ApiController extends Controller
{
    private $studentRepository;
    
    public function __construct(StudentRepositoryInterface $studentRepository)
    {
        $this->studentRepository = $studentRepository;
    }

    public function getAllStudents() 
    {
        $students = $this->studentRepository->all();

        return $this->show($students, 'Students not found');
    }

    public function getStudent($id) 
    {
        $student = $this->studentRepository->getStudent($id);

        return $this->show($student, 'Student not found');        
    }
    
    public function getSearchStudent($name) 
    {
        $students = $this->studentRepository->getSearchStudent($name);

        return $this->show($students, 'Students not found');
    }
 
    public function getStudentTeachers($studetnId) 
    {
        $teachers = $this->studentRepository->getStudentTeachers($studetnId);
        
        if ($teachers) {
            return $this->show($teachers, 'Teachers not found');
        }

        return response()->json([
            "message" => "Student not found"
          ], 404);
    }

    private function show(\Illuminate\Database\Eloquent\Collection $collection, $textNotFound = 'Not found') 
    {
        if (!$collection->isEmpty()) {
            return response($collection->toJson(JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE), 200);
        } else {
            return response()->json([
                "message" => $textNotFound
              ], 404);           
        }
    }
}
