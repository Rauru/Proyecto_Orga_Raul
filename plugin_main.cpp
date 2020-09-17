#include <iostream>
#include "easm.h"
#include "rlutil.h"

extern "C" ErrorCode handleSyscall(uint32_t *regs, void *mem, MemoryMap *mem_map)
{
    unsigned v0 = regs[Register::v0];
    rlutil::setColor(rlutil::RED);
    switch (v0)
    {   
        case 0:{
            rlutil::cls();
            return ErrorCode::Ok;
        }
        case 55:{
            rlutil::hidecursor();
            return ErrorCode::Ok;
        }
        case 20:{
            rlutil::hidecursor();
            int a0 = regs[Register::a0];
            int a1 = regs[Register::a1];
            int a2 = regs[Register::a2];
            int a3 = regs[Register::a3];
            rlutil::setBackgroundColor(a3);
            rlutil::locate(a0,a1);
            rlutil::setChar(a2);
            std::cout.flush();
            rlutil::msleep(40);
            return ErrorCode::Ok;
        }
        case 21:{
          //  RLUTIL_INLINE int nb_getch(	void	)
           // while(!kbhit()) {}
            //int getc=  rlutil::nb_getch();
           // int callgetkey = rlutil::getkey();
           //std::cout << "getkey: " << getc << '\n' << std::flush;
            regs[Register::v0] =  rlutil::nb_getch();
            //rlutil::msleep(5000);
            return ErrorCode::Ok;
        }
        case 222:{
            int a0 = regs[Register::a0];
            int a1 = regs[Register::a1];
            rlutil::cls();
            rlutil::setBackgroundColor(3);
            rlutil::locate(a0,a1);
            rlutil::setChar(35);
            rlutil::locate(a0+1,a1);


            rlutil::setBackgroundColor(3);
            rlutil::locate(1,1);
            rlutil::setChar(35);
            rlutil::locate(2,1);
            return ErrorCode::Ok;

        }
        case 122:
        {
            int a0 = regs[Register::a0];
            int a1 = regs[Register::a1];
            regs[Register::v0] = a0 + a1;
            return ErrorCode::Ok;
        }
        case 231:
        {
             rlutil::cls();
             regs[Register::a0] = rlutil::trows();
             regs[Register::a1]=rlutil::tcols();
             return ErrorCode::Ok;
        }
        case 232:
        {   
            rlutil::cls();
            
           rlutil::setBackgroundColor(3);
            rlutil::locate(20,20);

            rlutil::setChar(32);
             rlutil::locate(21,20);
           rlutil::setChar(32);
           rlutil::locate(22,20);
           rlutil::setChar(32);
           rlutil::locate(23,20);
           rlutil::setChar(32);
           rlutil::setBackgroundColor(5);
           rlutil::locate(24,20);
           rlutil::setChar(32);
           rlutil::locate(25,20);
           rlutil::setChar(32);


            
            rlutil::setBackgroundColor(4);
            rlutil::locate(100,21);
            rlutil::setChar(35);
            // rlutil::saveDefaultColor();
           // rlutil::resetColor();


           // rlutil::setBackgroundColor(4);
            //rlutil::locate(21,21);
            

           // rlutil::setBackgroundColor(9);
            //rlutil::locate(40,22);
           
            rlutil::setColor(14);
            return ErrorCode::Ok;
        }
        default:
            if (v0 > 100 && v0 <= 102)
            {
                
                std::cout << "Syscall: " << v0 << '\n' << std::flush;
               
                rlutil::anykey();
                return ErrorCode::Ok;
                
            }
            else
            {
                return ErrorCode::SyscallsNotSupported;
            }
    }
}
