// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;



contract ControleFluxo {
    struct Student {
        address addr;
        bool pay;
    }
    Student[] public students;

    function addStudents(address addr) public {
        students.push(Student(addr, false));
    }

    function pay() payable public {
        require(msg.value > 1, "Valor baixo");
        for (uint i = 0; i < students.length; i++) {
            Student storage s = students[i];
            if(s.addr == msg.sender){
                s.pay = true;
            }
        }
    }

    // As linhas em removeStudent estão fazendo o abaixo:
    // 1 2 4 5 6 7 8 ... 100
    // 1 2 4 5 6 100 8 ... 100
    // 1 2 4 5 6 100 8 ... 99
    function removeStudent(address adr) public {
        for (uint i = students.length; i > 0; i--){
            Student storage s = students[i-1];
            if (adr == s.addr) {
                students[i-1] = students[students.length - 1];
                students.pop();
            }
        }
    }
}
