Content-Type: multipart/mixed; boundary="===============9120003026009965425=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/entry] 2bbc68f837: ltp.ptrace08.fail
Date: Tue, 16 Jun 2020 16:57:07 +0200
Message-ID: <87ftav2h4s.fsf@nanos.tec.linutronix.de>
In-Reply-To: <8E41B15F-D567-4C52-94E9-367015480345@amacapital.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============9120003026009965425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andy Lutomirski <luto@amacapital.net> writes:
>> On Jun 16, 2020, at 1:44 AM, Thomas Gleixner <tglx@linutronix.de> wrot=
e:
>> =

>> =EF=BB=BFkernel test robot <rong.a.chen@intel.com> writes:
>>> FYI, we noticed the following commit (built with gcc-9):
>>> =

>>> commit: 2bbc68f8373c0631ebf137f376fbea00e8086be7 ("x86/entry: Convert D=
ebug exception to IDTENTRY_DB")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>> =

>> Is the head of linux.git exposing the same problem or is this an
>> intermittent failure, which only affects bisectability?
>
> It sure looks deterministic:
>
> ptrace08.c:62: BROK: Cannot find address of kernel symbol "do_debug"

Hahahaha. But not only LTP, also LKP-tests makes assumptions:

  monitors/irq_exception_noise:[ "$exception" -eq "1" ] && export ftrace_fi=
lters=3D'__do_page_fault do_divide_error do_overflow do_bounds do_invalid_o=
p do_device_not_available do_double_fault do_coprocessor_segment_overrun do=
_invalid_TSS do_segment_not_present do_spurious_interrupt_bug do_coprocesso=
r_error do_alignment_check do_simd_coprocessor_error do_debug do_stack_segm=
ent do_general_protection'

stable-api-nonsense.rst comes to my mind.

Thanks,

        tglx

--===============9120003026009965425==--

