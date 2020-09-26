#include <iostream>
#include "easm.h"
#include "rlutil.h"

extern "C" ErrorCode handleSyscall(uint32_t *regs, void *mem, MemoryMap *mem_map)
{
    unsigned v0 = regs[Register::v0];
    //rlutil::setColor(rlutil::RED);
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
           // rlutil::msleep(100);
            return ErrorCode::Ok;
        }
        case 21:{
          //  RLUTIL_INLINE int nb_getch(	void	)
           // while(!kbhit()) {}
           
            
            //regs[Register::a0] =  rlutil::getkey();
            //while(!kbhit()) {}
            if(kbhit()){
                regs[Register::a0] =  rlutil::nb_getch();
            }else{
                 regs[Register::a0] = 0;
            }

            if(kbhit()){
                regs[Register::a1] =  rlutil::nb_getch();
            }else{
                 regs[Register::a1] = 0;
            }
            
            // while(!kbhit()) {}
            //regs[Register::a2] =  rlutil::nb_getch();
           
            //std::cout << "getkey: " << regs[Register::a0] << '\n' << std::flush;
            // rlutil::msleep(190);
            //std::cout << "getkeyv1: " << regs[Register::v1] << '\n' << std::flush;
           // rlutil::msleep(5000);
            std::cout.flush();
            return ErrorCode::Ok;
        }
        case 22:{
            int a0 = regs[Register::a0];
            rlutil::setColor(a0);
             return ErrorCode::Ok;
        }
        case 23:{
          //  RLUTIL_INLINE int nb_getch(	void	)

          std::cout << "DEFENDER " << '\n' << std::flush;
          std::cout << "Press any key " << '\n' << std::flush;
            while(!kbhit()) {}
           
            
            regs[Register::a0] =  rlutil::getkey();
            
            // while(!kbhit()) {}
            //regs[Register::a2] =  rlutil::nb_getch();
           
            
            // rlutil::msleep(190);
            //std::cout << "getkeyv1: " << regs[Register::v1] << '\n' << std::flush;
           // rlutil::msleep(5000);
            std::cout.flush();
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
