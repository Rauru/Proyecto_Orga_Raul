#include <iostream>
#include "easm.h"
#include "rlutil.h"

extern "C" ErrorCode handleSyscall(uint32_t *regs, void *mem, MemoryMap *mem_map)
{
    unsigned v0 = regs[Register::v0];

    switch (v0)
    {
        case 20:
        {
            int a0 = regs[Register::a0];
            int a1 = regs[Register::a1];
            regs[Register::v0] = a0 + a1;
            return ErrorCode::Ok;
        }
        default:
            if (v0 > 20 && v0 <= 50)
            {
                rlutil::cls();
                std::cout << "Syscall: " << v0 << '\n' << std::flush;
                rlutil::cls();
                rlutil::anykey();
                return ErrorCode::Ok;
                
            }
            else
            {
                return ErrorCode::SyscallsNotSupported;
            }
    }
}
