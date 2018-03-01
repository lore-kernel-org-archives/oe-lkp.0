Content-Type: multipart/mixed; boundary="===============2884825596430643978=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] c162d5b433: BUG:KASAN:use-after-scope_in_c
Date: Thu, 01 Mar 2018 12:26:15 +0900
Message-ID: <201803010326.w213QFLZ007358@www262.sakura.ne.jp>
In-Reply-To: <20180228155941.34z45rjz3bjqde7w@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2884825596430643978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Tetsuo Handa wrote:
> Petr Mladek wrote:
> > I am really curious what code is proceed on the line
> > console_unlock+0x185/0x960.
> =

> I can reproduce this warning with VMware environment.
> Something is happening inside __asan_store1() before calling raw_spin_loc=
k(&console_owner_lock) ?
> =


Interesting thing is that as of commit 97ace515f01439d4 on linux.git, there=
 is no
such __asan_store1() before calling raw_spin_lock(&console_owner_lock) and =
hence
cannot reproduce this warning. Maybe a KASAN bug as of commit c162d5b4338d7=
2de ?



ffffffff8115d3a1 <console_unlock>:
 * If there is output waiting, we wake /dev/kmsg and syslog() users.
 *
 * console_unlock(); may be called from any context.
 */
void console_unlock(void)
{
ffffffff8115d3a1:       e8 5a 44 ca 00          callq  ffffffff81e01800 <__=
fentry__>
ffffffff8115d3a6:       41 57                   push   %r15
ffffffff8115d3a8:       41 56                   push   %r14
ffffffff8115d3aa:       41 55                   push   %r13
ffffffff8115d3ac:       41 54                   push   %r12
ffffffff8115d3ae:       55                      push   %rbp
ffffffff8115d3af:       53                      push   %rbx
ffffffff8115d3b0:       48 83 ec 28             sub    $0x28,%rsp
        static u64 seen_seq;
        unsigned long flags;
        bool wake_klogd =3D false;
        bool do_cond_resched, retry;

        if (console_suspended) {
ffffffff8115d3b4:       e8 6e e6 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d3b9:       83 3d 60 e1 34 03 00    cmpl   $0x0,0x334e160(%rip)=
        # ffffffff844ab520 <console_suspended>
ffffffff8115d3c0:       74 0a                   je     ffffffff8115d3cc <co=
nsole_unlock+0x2b>
                up_console_sem();
ffffffff8115d3c2:       e8 60 e6 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d3c7:       e9 4d 07 00 00          jmpq   ffffffff8115db19 <co=
nsole_unlock+0x778>
         *
         * console_trylock() is not able to detect the preemptive
         * context reliably. Therefore the value must be stored before
         * and cleared after the the "again" goto label.
         */
        do_cond_resched =3D console_may_schedule;
ffffffff8115d3cc:       e8 56 e6 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d3d1:       8b 05 69 df 34 03       mov    0x334df69(%rip),%eax=
        # ffffffff844ab340 <console_may_schedule>
{
        static char ext_text[CONSOLE_EXT_LOG_MAX];
        static char text[LOG_LINE_MAX + PREFIX_MAX];
        static u64 seen_seq;
        unsigned long flags;
        bool wake_klogd =3D false;
ffffffff8115d3d7:       45 31 f6                xor    %r14d,%r14d

static __always_inline bool variable_test_bit(long nr, volatile const unsig=
ned long *addr)
{
        bool oldbit;

        asm volatile("bt %2,%1"
ffffffff8115d3da:       49 c7 c5 e8 92 01 83    mov    $0xffffffff830192e8,=
%r13
         *
         * console_trylock() is not able to detect the preemptive
         * context reliably. Therefore the value must be stored before
         * and cleared after the the "again" goto label.
         */
        do_cond_resched =3D console_may_schedule;
ffffffff8115d3e1:       89 44 24 18             mov    %eax,0x18(%rsp)
again:
        console_may_schedule =3D 0;
ffffffff8115d3e5:       e8 3d e6 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
 * unless they're explicitly marked as being able to cope (CON_ANYTIME) don=
't
 * call them until this CPU is officially up.
 */
static inline int can_use_console(void)
{
        return cpu_online(raw_smp_processor_id()) || have_callable_console(=
);
ffffffff8115d3ea:       65 8b 05 3f ad eb 7e    mov    %gs:0x7eebad3f(%rip)=
,%eax        # 18130 <cpu_number>
         * context reliably. Therefore the value must be stored before
         * and cleared after the the "again" goto label.
         */
        do_cond_resched =3D console_may_schedule;
again:
        console_may_schedule =3D 0;
ffffffff8115d3f1:       c7 05 45 df 34 03 00    movl   $0x0,0x334df45(%rip)=
        # ffffffff844ab340 <console_may_schedule>
ffffffff8115d3f8:       00 00 00
 *
 * Returns 1 if @cpu is set in @cpumask, else returns 0
 */
static inline int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
{
        return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
ffffffff8115d3fb:       89 c0                   mov    %eax,%eax
ffffffff8115d3fd:       49 0f a3 45 00          bt     %rax,0x0(%r13)
 * unless they're explicitly marked as being able to cope (CON_ANYTIME) don=
't
 * call them until this CPU is officially up.
 */
static inline int can_use_console(void)
{
        return cpu_online(raw_smp_processor_id()) || have_callable_console(=
);
ffffffff8115d402:       0f 82 26 01 00 00       jb     ffffffff8115d52e <co=
nsole_unlock+0x18d>
 */
static int have_callable_console(void)
{
        struct console *con;

        for_each_console(con)
ffffffff8115d408:       e8 1a e6 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d40d:       48 8b 1d cc e1 34 03    mov    0x334e1cc(%rip),%rbx=
        # ffffffff844ab5e0 <console_drivers>
ffffffff8115d414:       e8 0e e6 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d419:       48 85 db                test   %rbx,%rbx
ffffffff8115d41c:       0f 84 e8 06 00 00       je     ffffffff8115db0a <co=
nsole_unlock+0x769>
                if ((con->flags & CON_ENABLED) &&
ffffffff8115d422:       e8 00 e6 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d427:       48 8d 7b 40             lea    0x40(%rbx),%rdi
ffffffff8115d42b:       e8 4c 1c 1a 00          callq  ffffffff812ff07c <__=
asan_load2>
ffffffff8115d430:       8b 43 40                mov    0x40(%rbx),%eax
ffffffff8115d433:       83 e0 14                and    $0x14,%eax
ffffffff8115d436:       66 83 f8 14             cmp    $0x14,%ax
ffffffff8115d43a:       0f 84 ee 00 00 00       je     ffffffff8115d52e <co=
nsole_unlock+0x18d>
 */
static int have_callable_console(void)
{
        struct console *con;

        for_each_console(con)
ffffffff8115d440:       e8 e2 e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d445:       48 8d 7b 50             lea    0x50(%rbx),%rdi
ffffffff8115d449:       e8 18 1e 1a 00          callq  ffffffff812ff266 <__=
asan_load8>
ffffffff8115d44e:       48 8b 5b 50             mov    0x50(%rbx),%rbx
ffffffff8115d452:       eb c0                   jmp    ffffffff8115d414 <co=
nsole_unlock+0x73>
ffffffff8115d454:       e8 ce e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d459:       65 8b 05 d0 ac eb 7e    mov    %gs:0x7eebacd0(%rip)=
,%eax        # 18130 <cpu_number>
ffffffff8115d460:       89 c0                   mov    %eax,%eax
ffffffff8115d462:       49 0f a3 45 00          bt     %rax,0x0(%r13)
ffffffff8115d467:       0f 82 b1 03 00 00       jb     ffffffff8115d81e <co=
nsole_unlock+0x47d>
{
        struct console *con;

        trace_console_rcuidle(text, len);

        if (!console_drivers)
ffffffff8115d46d:       e8 b5 e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d472:       48 8b 1d 67 e1 34 03    mov    0x334e167(%rip),%rbx=
        # ffffffff844ab5e0 <console_drivers>
ffffffff8115d479:       48 85 db                test   %rbx,%rbx
ffffffff8115d47c:       0f 85 63 04 00 00       jne    ffffffff8115d8e5 <co=
nsole_unlock+0x544>
                 */
                console_lock_spinning_enable();

                stop_critical_timings();        /* don't trace print latenc=
y */
                call_console_drivers(ext_text, ext_len, text, len);
                start_critical_timings();
ffffffff8115d482:       e8 a0 e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d487:       e8 ce 49 0a 00          callq  ffffffff81201e5a <st=
art_critical_timings>
 */
static int console_lock_spinning_disable_and_check(void)
{
        int waiter;

        raw_spin_lock(&console_owner_lock);
ffffffff8115d48c:       48 c7 c7 00 38 b5 82    mov    $0xffffffff82b53800,=
%rdi     /*** ffffffff82b53800 d console_owner_lock ***/
ffffffff8115d493:       48 89 eb                mov    %rbp,%rbx
ffffffff8115d496:       e8 5e b3 bf 00          callq  ffffffff81d587f9 <_r=
aw_spin_lock>
ffffffff8115d49b:       44 8a 25 7e da 24 03    mov    0x324da7e(%rip),%r12=
b        # ffffffff843aaf20 <console_waiter>
        waiter =3D READ_ONCE(console_waiter);
        console_owner =3D NULL;
        raw_spin_unlock(&console_owner_lock);
ffffffff8115d4a2:       48 c7 c7 00 38 b5 82    mov    $0xffffffff82b53800,=
%rdi
{
        int waiter;

        raw_spin_lock(&console_owner_lock);
        waiter =3D READ_ONCE(console_waiter);
        console_owner =3D NULL;
ffffffff8115d4a9:       48 c7 05 ac da 24 03    movq   $0x0,0x324daac(%rip)=
        # ffffffff843aaf60 <console_owner>
ffffffff8115d4b0:       00 00 00 00
ffffffff8115d4b4:       81 e3 00 02 00 00       and    $0x200,%ebx
        raw_spin_unlock(&console_owner_lock);
ffffffff8115d4ba:       e8 95 b5 bf 00          callq  ffffffff81d58a54 <_r=
aw_spin_unlock>

        if (!waiter) {
ffffffff8115d4bf:       45 84 e4                test   %r12b,%r12b
ffffffff8115d4c2:       0f 85 cf 04 00 00       jne    ffffffff8115d997 <co=
nsole_unlock+0x5f6>
                spin_release(&console_owner_dep_map, 1, _THIS_IP_);
ffffffff8115d4c8:       e8 5a e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d4cd:       48 c7 c2 c8 d4 15 81    mov    $0xffffffff8115d4c8,=
%rdx
ffffffff8115d4d4:       be 01 00 00 00          mov    $0x1,%esi
ffffffff8115d4d9:       48 c7 c7 80 38 b5 82    mov    $0xffffffff82b53880,=
%rdi
ffffffff8115d4e0:       e8 97 82 fe ff          callq  ffffffff8114577c <lo=
ck_release>
                if (console_lock_spinning_disable_and_check()) {
                        printk_safe_exit_irqrestore(flags);
                        return;
                }

                printk_safe_exit_irqrestore(flags);
ffffffff8115d4e5:       e8 f3 25 00 00          callq  ffffffff8115fadd <__=
printk_safe_exit>
ffffffff8115d4ea:       48 85 db                test   %rbx,%rbx
ffffffff8115d4ed:       0f 85 22 05 00 00       jne    ffffffff8115da15 <co=
nsole_unlock+0x674>
ffffffff8115d4f3:       e8 2f e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d4f8:       48 89 ef                mov    %rbp,%rdi
ffffffff8115d4fb:       e8 f4 cf ff ff          callq  ffffffff8115a4f4 <ar=
ch_local_irq_restore>
ffffffff8115d500:       e8 94 25 fe ff          callq  ffffffff8113fa99 <tr=
ace_hardirqs_off>

                if (do_cond_resched)
ffffffff8115d505:       e8 1d e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d50a:       83 7c 24 18 00          cmpl   $0x0,0x18(%rsp)
ffffffff8115d50f:       74 1d                   je     ffffffff8115d52e <co=
nsole_unlock+0x18d>
                        cond_resched();
ffffffff8115d511:       e8 11 e5 06 00          callq  ffffffff811cba27 <__=
sanitizer_cov_trace_pc>
ffffffff8115d516:       31 d2                   xor    %edx,%edx
ffffffff8115d518:       be 66 09 00 00          mov    $0x966,%esi
ffffffff8115d51d:       48 c7 c7 20 85 27 82    mov    $0xffffffff82278520,=
%rdi
ffffffff8115d524:       e8 24 8b fb ff          callq  ffffffff8111604d <__=
_might_sleep>
ffffffff8115d529:       e8 ad 68 bf 00          callq  ffffffff81d53ddb <_c=
ond_resched>

--===============2884825596430643978==--

