Content-Type: multipart/mixed; boundary="===============4272078859013845910=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [printk] c162d5b433: BUG:KASAN:use-after-scope_in_c
Date: Thu, 01 Mar 2018 10:08:19 +0900
Message-ID: <201803010108.w2118JFC059608@www262.sakura.ne.jp>
In-Reply-To: <20180228155941.34z45rjz3bjqde7w@pathway.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4272078859013845910==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Petr Mladek wrote:
> I am really curious what code is proceed on the line
> console_unlock+0x185/0x960.

I can reproduce this warning with VMware environment.
Something is happening inside __asan_store1() before calling raw_spin_lock(=
&console_owner_lock) ?



[    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-4.14.0-12953=
-gc162d5b root=3DUUID=3D98df1583-260a-423a-a193-182dade5d085 ro crashkernel=
=3D256M security=3Dnone sysrq_always_enabled console=3DttyS0,115200n8 conso=
le=3Dtty0 LANG=3Den_US.UTF-8
[    0.000000] sysrq: sysrq always enabled.
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes)
[    0.000000] Memory: 3045216K/4193716K available (15633K kernel code, 627=
8K rwdata, 6948K rodata, 3592K init, 24228K bss, 1148500K reserved, 0K cma-=
reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D64, =
Nodes=3D1
[    0.000000] ftrace: allocating 34522 entries in 135 pages
[    0.003333] Running RCU self tests
[    0.003333] Hierarchical RCU implementation.
[    0.003333] 	RCU event tracing is enabled.
[    0.003333] 	RCU dyntick-idle grace-period acceleration is enabled.
[    0.003333] 	RCU lockdep checking is enabled.
[    0.003333] 	Tasks RCU enabled.
[    0.003333] NR_IRQS: 4352, nr_irqs: 936, preallocated irqs: 16
[    0.003333] 	Offload RCU callbacks from CPUs: .
[    0.003333] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.003333] BUG: KASAN: use-after-scope in console_unlock+0x185/0x960
[    0.003333] Write of size 1 at addr ffffffff828079b8 by task swapper/0
[    0.003333] =

[    0.003333] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-12953-gc162d5=
b #414
[    0.003333] Call Trace:
[    0.003333]  ? dump_stack+0x11d/0x1c5
[    0.003333]  ? printk+0xb5/0xd1
[    0.003333]  ? arch_local_irq_restore+0x17/0x17
[    0.003333]  ? do_raw_spin_unlock+0x137/0x169
[    0.003333]  ? irq_trace+0x2e/0x32
[    0.003333]  ? console_unlock+0x185/0x960
[    0.003333]  ? print_address_description+0x6e/0x23b
[    0.003333]  ? console_unlock+0x185/0x960
[    0.003333]  ? kasan_report+0x223/0x249
[    0.003333]  ? console_unlock+0x185/0x960
[    0.003333]  ? wake_up_klogd+0xdf/0xdf
[    0.003333]  ? do_raw_spin_unlock+0x145/0x169
[    0.003333]  ? do_raw_spin_trylock+0xed/0xed
[    0.003333]  ? irq_trace+0x2e/0x32
[    0.003333]  ? _raw_spin_unlock_irqrestore+0x3b/0x54
[    0.003333]  ? time_hardirqs_off+0x12/0x2d
[    0.003333]  ? arch_local_save_flags+0x7/0x8
[    0.003333]  ? trace_hardirqs_off_caller+0x127/0x139
[    0.003333]  ? irq_trace+0x2e/0x32
[    0.003333]  ? vprintk_emit+0x579/0x823
[    0.003333]  ? __down_trylock_console_sem+0x90/0xa4
[    0.003333]  ? __down_trylock_console_sem+0x9d/0xa4
[    0.003333]  ? vprintk_emit+0x7ec/0x823
[    0.003333]  ? console_unlock+0x960/0x960
[    0.003333]  ? memblock_merge_regions+0x2d/0x154
[    0.003333]  ? memblock_add_range+0x322/0x333
[    0.003333]  ? memblock_reserve+0xbb/0xe1
[    0.003333]  ? memblock_add+0xe1/0xe1
[    0.003333]  ? set_pte+0x24/0x27
[    0.003333]  ? vprintk_func+0x94/0xa5
[    0.003333]  ? printk+0xb5/0xd1
[    0.003333]  ? show_regs_print_info+0x41/0x41
[    0.003333]  ? kasan_populate_zero_shadow+0x37b/0x3f6
[    0.003333]  ? native_flush_tlb_global+0x74/0x80
[    0.003333]  ? kasan_init+0x211/0x22d
[    0.003333]  ? setup_arch+0xdfa/0xf3c
[    0.003333]  ? css_set_populated+0x79/0x79
[    0.003333]  ? reserve_standard_io_resources+0x39/0x39
[    0.003333]  ? vprintk_func+0x9d/0xa5
[    0.003333]  ? printk+0xb5/0xd1
[    0.003333]  ? show_regs_print_info+0x41/0x41
[    0.003333]  ? start_kernel+0xa2/0x515
[    0.003333]  ? mem_encrypt_init+0xa/0xa
[    0.003333]  ? x86_family+0x2e/0x33
[    0.003333]  ? load_ucode_bsp+0x58/0xec
[    0.003333]  ? secondary_startup_64+0xa5/0xb0
[    0.003333] =

[    0.003333] =

[    0.003333] Memory state around the buggy address:
[    0.003333]  ffffffff82807880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00
[    0.003333]  ffffffff82807900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00
[    0.003333] >ffffffff82807980: 00 00 00 f1 f1 f1 f1 f8 f2 f2 f2 f2 f2 f2=
 f2 01
[    0.003333]                                         ^
[    0.003333]  ffffffff82807a00: f2 f2 f2 f2 f2 f2 f2 00 f2 f2 f2 f3 f3 f3=
 f3 00
[    0.003333]  ffffffff82807a80: 00 00 00 00 00 00 00 00 00 00 00 00 00 f1=
 f1 f1
[    0.003333] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.003333] Disabling lock debugging due to kernel taint
[    0.003333] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.003333] BUG: KASAN: use-after-scope in console_unlock+0x185/0x960
[    0.003333] Write of size 1 at addr ffffffff828079b8 by task swapper/0
[    0.003333] =

[    0.003333] CPU: 0 PID: 0 Comm: swapper Not tainted 4.14.0-12953-gc162d5=
b #414
[    0.003333] Call Trace:
[    0.003333]  ? dump_stack+0x11d/0x1c5
[    0.003333]  ? printk+0xb5/0xd1
[    0.003333]  ? arch_local_irq_restore+0x17/0x17
[    0.003333]  ? do_raw_spin_unlock+0x137/0x169
[    0.003333]  ? irq_trace+0x2e/0x32
[    0.003333]  ? console_unlock+0x185/0x960
[    0.003333]  ? print_address_description+0x6e/0x23b
[    0.003333]  ? console_unlock+0x185/0x960
[    0.003333]  ? kasan_report+0x223/0x249
[    0.003333]  ? console_unlock+0x185/0x960
[    0.003333]  ? wake_up_klogd+0xdf/0xdf
[    0.003333]  ? do_raw_spin_unlock+0x145/0x169
[    0.003333]  ? do_raw_spin_trylock+0xed/0xed
[    0.003333]  ? irq_trace+0x2e/0x32
[    0.003333]  ? _raw_spin_unlock_irqrestore+0x3b/0x54
[    0.003333]  ? time_hardirqs_off+0x12/0x2d
[    0.003333]  ? arch_local_save_flags+0x7/0x8
[    0.003333]  ? trace_hardirqs_off_caller+0x127/0x139
[    0.003333]  ? irq_trace+0x2e/0x32
[    0.003333]  ? vprintk_emit+0x579/0x823
[    0.003333]  ? __down_trylock_console_sem+0x90/0xa4
[    0.003333]  ? __down_trylock_console_sem+0x9d/0xa4
[    0.003333]  ? vprintk_emit+0x7ec/0x823
[    0.003333]  ? console_unlock+0x960/0x960
[    0.003333]  ? memblock_merge_regions+0x2d/0x154
[    0.003333]  ? memblock_add_range+0x322/0x333
[    0.003333]  ? memblock_reserve+0xbb/0xe1
[    0.003333]  ? memblock_add+0xe1/0xe1
[    0.003333]  ? set_pte+0x24/0x27
[    0.003333]  ? vprintk_func+0x94/0xa5
[    0.003333]  ? printk+0xb5/0xd1
[    0.003333]  ? show_regs_print_info+0x41/0x41
[    0.003333]  ? kasan_populate_zero_shadow+0x37b/0x3f6
[    0.003333]  ? native_flush_tlb_global+0x74/0x80
[    0.003333]  ? kasan_init+0x211/0x22d
[    0.003333]  ? setup_arch+0xdfa/0xf3c
[    0.003333]  ? css_set_populated+0x79/0x79
[    0.003333]  ? reserve_standard_io_resources+0x39/0x39
[    0.003333]  ? vprintk_func+0x9d/0xa5
[    0.003333]  ? printk+0xb5/0xd1
[    0.003333]  ? show_regs_print_info+0x41/0x41
[    0.003333]  ? start_kernel+0xa2/0x515
[    0.003333]  ? mem_encrypt_init+0xa/0xa
[    0.003333]  ? x86_family+0x2e/0x33
[    0.003333]  ? load_ucode_bsp+0x58/0xec
[    0.003333]  ? secondary_startup_64+0xa5/0xb0
[    0.003333] =

[    0.003333] =

[    0.003333] Memory state around the buggy address:
[    0.003333]  ffffffff82807880: 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00
[    0.003333]  ffffffff82807900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00
[    0.003333] >ffffffff82807980: 00 00 00 f1 f1 f1 f1 f8 f2 f2 f2 f2 f2 f2=
 f2 01
[    0.003333]                                         ^
[    0.003333]  ffffffff82807a00: f2 f2 f2 f2 f2 f2 f2 00 f2 f2 f2 f3 f3 f3=
 f3 00
[    0.003333]  ffffffff82807a80: 00 00 00 00 00 00 00 00 00 00 00 00 00 f1=
 f1 f1
[    0.003333] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[    0.003333] Disabling lock debugging due to kernel taint
[    0.003333] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



# ./scripts/faddr2line vmlinux console_unlock+0x185/0x960
console_unlock+0x185/0x960:
console_lock_spinning_disable_and_check at kernel/printk/printk.c:1600
 (inlined by) console_unlock at kernel/printk/printk.c:2386



ffffffff81190da4 <console_unlock>:
 * If there is output waiting, we wake /dev/kmsg and syslog() users.
 *
 * console_unlock(); may be called from any context.
 */
void console_unlock(void)
{
ffffffff81190da4:	e8 57 e1 da 00       	callq  ffffffff81f3ef00 <__fentry__>
ffffffff81190da9:	55                   	push   %rbp
ffffffff81190daa:	48 89 e5             	mov    %rsp,%rbp
ffffffff81190dad:	41 57                	push   %r15
ffffffff81190daf:	41 56                	push   %r14
ffffffff81190db1:	48 8d 85 f8 fe ff ff 	lea    -0x108(%rbp),%rax
ffffffff81190db8:	41 55                	push   %r13
ffffffff81190dba:	41 54                	push   %r12
ffffffff81190dbc:	53                   	push   %rbx
ffffffff81190dbd:	48 bb 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbx
ffffffff81190dc4:	fc ff df =

ffffffff81190dc7:	48 c1 e8 03          	shr    $0x3,%rax
ffffffff81190dcb:	48 81 ec 20 01 00 00 	sub    $0x120,%rsp
ffffffff81190dd2:	48 89 85 d0 fe ff ff 	mov    %rax,-0x130(%rbp)
ffffffff81190dd9:	48 01 d8             	add    %rbx,%rax
ffffffff81190ddc:	48 c7 85 f8 fe ff ff 	movq   $0x41b58ab3,-0x108(%rbp)
ffffffff81190de3:	b3 8a b5 41 =

ffffffff81190de7:	48 c7 85 00 ff ff ff 	movq   $0xffffffff825fb4c2,-0x100(%=
rbp)
ffffffff81190dee:	c2 b4 5f 82 =

ffffffff81190df2:	48 c7 85 08 ff ff ff 	movq   $0xffffffff81190da4,-0xf8(%r=
bp)
ffffffff81190df9:	a4 0d 19 81 =

ffffffff81190dfd:	c7 00 f1 f1 f1 f1    	movl   $0xf1f1f1f1,(%rax)
ffffffff81190e03:	c7 40 04 01 f2 f2 f2 	movl   $0xf2f2f201,0x4(%rax)
ffffffff81190e0a:	c7 40 08 f2 f2 f2 f2 	movl   $0xf2f2f2f2,0x8(%rax)
ffffffff81190e11:	c7 40 0c 01 f2 f2 f2 	movl   $0xf2f2f201,0xc(%rax)
ffffffff81190e18:	c7 40 10 f2 f2 f2 f2 	movl   $0xf2f2f2f2,0x10(%rax)
ffffffff81190e1f:	c7 40 14 00 f2 f2 f2 	movl   $0xf2f2f200,0x14(%rax)
ffffffff81190e26:	c7 40 18 f3 f3 f3 f3 	movl   $0xf3f3f3f3,0x18(%rax)
	static u64 seen_seq;
	unsigned long flags;
	bool wake_klogd =3D false;
	bool do_cond_resched, retry;

	if (console_suspended) {
ffffffff81190e2d:	e8 3f 82 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190e32:	83 3d a7 c2 14 03 00 	cmpl   $0x0,0x314c2a7(%rip)        =
# ffffffff842dd0e0 <console_suspended>
ffffffff81190e39:	74 0a                	je     ffffffff81190e45 <console_un=
lock+0xa1>
		up_console_sem();
ffffffff81190e3b:	e8 31 82 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190e40:	e9 85 08 00 00       	jmpq   ffffffff811916ca <console_un=
lock+0x926>
	 *
	 * console_trylock() is not able to detect the preemptive
	 * context reliably. Therefore the value must be stored before
	 * and cleared after the the "again" goto label.
	 */
	do_cond_resched =3D console_may_schedule;
ffffffff81190e45:	e8 27 82 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190e4a:	8b 05 b0 c0 14 03    	mov    0x314c0b0(%rip),%eax        =
# ffffffff842dcf00 <console_may_schedule>
{
	static char ext_text[CONSOLE_EXT_LOG_MAX];
	static char text[LOG_LINE_MAX + PREFIX_MAX];
	static u64 seen_seq;
	unsigned long flags;
	bool wake_klogd =3D false;
ffffffff81190e50:	45 31 ed             	xor    %r13d,%r13d
ffffffff81190e53:	48 89 9d e8 fe ff ff 	mov    %rbx,-0x118(%rbp)
	 *
	 * console_trylock() is not able to detect the preemptive
	 * context reliably. Therefore the value must be stored before
	 * and cleared after the the "again" goto label.
	 */
	do_cond_resched =3D console_may_schedule;
ffffffff81190e5a:	89 85 cc fe ff ff    	mov    %eax,-0x134(%rbp)
again:
	console_may_schedule =3D 0;
ffffffff81190e60:	e8 0c 82 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
 * unless they're explicitly marked as being able to cope (CON_ANYTIME) don=
't
 * call them until this CPU is officially up.
 */
static inline int can_use_console(void)
{
	return cpu_online(raw_smp_processor_id()) || have_callable_console();
ffffffff81190e65:	65 8b 05 bc 22 e8 7e 	mov    %gs:0x7ee822bc(%rip),%eax   =
     # 13128 <cpu_number>
	 * context reliably. Therefore the value must be stored before
	 * and cleared after the the "again" goto label.
	 */
	do_cond_resched =3D console_may_schedule;
again:
	console_may_schedule =3D 0;
ffffffff81190e6c:	c7 05 8a c0 14 03 00 	movl   $0x0,0x314c08a(%rip)        =
# ffffffff842dcf00 <console_may_schedule>
ffffffff81190e73:	00 00 00 =

 *
 * Returns 1 if @cpu is set in @cpumask, else returns 0
 */
static inline int cpumask_test_cpu(int cpu, const struct cpumask *cpumask)
{
	return test_bit(cpumask_check(cpu), cpumask_bits((cpumask)));
ffffffff81190e76:	89 c0                	mov    %eax,%eax

static __always_inline bool variable_test_bit(long nr, volatile const unsig=
ned long *addr)
{
	bool oldbit;

	asm volatile("bt %2,%1"
ffffffff81190e78:	48 0f a3 05 a8 ad c8 	bt     %rax,0x1c8ada8(%rip)        =
# ffffffff82e1bc28 <__cpu_online_mask>
ffffffff81190e7f:	01 =

ffffffff81190e80:	49 c7 c6 28 bc e1 82 	mov    $0xffffffff82e1bc28,%r14
 * unless they're explicitly marked as being able to cope (CON_ANYTIME) don=
't
 * call them until this CPU is officially up.
 */
static inline int can_use_console(void)
{
	return cpu_online(raw_smp_processor_id()) || have_callable_console();
ffffffff81190e87:	0f 82 a3 01 00 00    	jb     ffffffff81191030 <console_un=
lock+0x28c>
 */
static int have_callable_console(void)
{
	struct console *con;

	for_each_console(con)
ffffffff81190e8d:	e8 df 81 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190e92:	48 8b 1d 07 c3 14 03 	mov    0x314c307(%rip),%rbx        =
# ffffffff842dd1a0 <console_drivers>
ffffffff81190e99:	e8 d3 81 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190e9e:	48 85 db             	test   %rbx,%rbx
ffffffff81190ea1:	0f 84 14 08 00 00    	je     ffffffff811916bb <console_un=
lock+0x917>
		if ((con->flags & CON_ENABLED) &&
ffffffff81190ea7:	e8 c5 81 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190eac:	48 8d 7b 40          	lea    0x40(%rbx),%rdi
ffffffff81190eb0:	e8 bd 51 1f 00       	callq  ffffffff81386072 <__asan_loa=
d2>
ffffffff81190eb5:	8b 43 40             	mov    0x40(%rbx),%eax
ffffffff81190eb8:	83 e0 14             	and    $0x14,%eax
ffffffff81190ebb:	66 83 f8 14          	cmp    $0x14,%ax
ffffffff81190ebf:	0f 84 6b 01 00 00    	je     ffffffff81191030 <console_un=
lock+0x28c>
 */
static int have_callable_console(void)
{
	struct console *con;

	for_each_console(con)
ffffffff81190ec5:	e8 a7 81 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190eca:	48 8d 7b 50          	lea    0x50(%rbx),%rdi
ffffffff81190ece:	e8 89 53 1f 00       	callq  ffffffff8138625c <__asan_loa=
d8>
ffffffff81190ed3:	48 8b 5b 50          	mov    0x50(%rbx),%rbx
ffffffff81190ed7:	eb c0                	jmp    ffffffff81190e99 <console_un=
lock+0xf5>
ffffffff81190ed9:	e8 93 81 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190ede:	65 8b 05 43 22 e8 7e 	mov    %gs:0x7ee82243(%rip),%eax   =
     # 13128 <cpu_number>
ffffffff81190ee5:	89 c0                	mov    %eax,%eax
ffffffff81190ee7:	49 0f a3 06          	bt     %rax,(%r14)
ffffffff81190eeb:	0f 82 6c 04 00 00    	jb     ffffffff8119135d <console_un=
lock+0x5b9>
{
	struct console *con;

	trace_console_rcuidle(text, len);

	if (!console_drivers)
ffffffff81190ef1:	e8 7b 81 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190ef6:	48 8b 1d a3 c2 14 03 	mov    0x314c2a3(%rip),%rbx        =
# ffffffff842dd1a0 <console_drivers>
ffffffff81190efd:	48 85 db             	test   %rbx,%rbx
ffffffff81190f00:	0f 85 5c 05 00 00    	jne    ffffffff81191462 <console_un=
lock+0x6be>
ffffffff81190f06:	48 8d 9d 18 ff ff ff 	lea    -0xe8(%rbp),%rbx
ffffffff81190f0d:	4c 8d a5 58 ff ff ff 	lea    -0xa8(%rbp),%r12
		 */
		console_lock_spinning_enable();

		stop_critical_timings();	/* don't trace print latency */
		call_console_drivers(ext_text, ext_len, text, len);
		start_critical_timings();
ffffffff81190f14:	e8 58 81 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190f19:	e8 18 a2 0c 00       	callq  ffffffff8125b136 <start_crit=
ical_timings>
ffffffff81190f1e:	48 89 df             	mov    %rbx,%rdi
static int console_lock_spinning_disable_and_check(void)
{
	int waiter;

	raw_spin_lock(&console_owner_lock);
	waiter =3D READ_ONCE(console_waiter);
ffffffff81190f21:	49 89 df             	mov    %rbx,%r15
ffffffff81190f24:	e8 04 51 1f 00       	callq  ffffffff8138602d <__asan_sto=
re1>
ffffffff81190f29:	4c 89 e7             	mov    %r12,%rdi                   =
           /*** console_unlock+0x185/0x960 ***/
ffffffff81190f2c:	c6 85 18 ff ff ff 00 	movb   $0x0,-0xe8(%rbp)
ffffffff81190f33:	49 c1 ef 03          	shr    $0x3,%r15
ffffffff81190f37:	e8 f1 50 1f 00       	callq  ffffffff8138602d <__asan_sto=
re1>
 */
static int console_lock_spinning_disable_and_check(void)
{
	int waiter;

	raw_spin_lock(&console_owner_lock);
ffffffff81190f3c:	48 c7 c7 e0 96 95 82 	mov    $0xffffffff829596e0,%rdi   /=
*** ffffffff829596e0 d console_owner_lock ***/
ffffffff81190f43:	c6 85 58 ff ff ff 00 	movb   $0x0,-0xa8(%rbp)
ffffffff81190f4a:	e8 9a bd da 00       	callq  ffffffff81f3cce9 <_raw_spin_=
lock>
	waiter =3D READ_ONCE(console_waiter);
ffffffff81190f4f:	4c 03 bd e8 fe ff ff 	add    -0x118(%rbp),%r15
ffffffff81190f56:	8a 05 c4 bb 04 03    	mov    0x304bbc4(%rip),%al        #=
 ffffffff841dcb20 <console_waiter>
ffffffff81190f5c:	48 89 df             	mov    %rbx,%rdi
ffffffff81190f5f:	88 85 e0 fe ff ff    	mov    %al,-0x120(%rbp)
ffffffff81190f65:	41 c6 07 01          	movb   $0x1,(%r15)
ffffffff81190f69:	e8 bf 50 1f 00       	callq  ffffffff8138602d <__asan_sto=
re1>
ffffffff81190f6e:	8a 85 e0 fe ff ff    	mov    -0x120(%rbp),%al
ffffffff81190f74:	48 89 df             	mov    %rbx,%rdi
ffffffff81190f77:	88 85 18 ff ff ff    	mov    %al,-0xe8(%rbp)
ffffffff81190f7d:	e8 69 50 1f 00       	callq  ffffffff81385feb <__asan_loa=
d1>
ffffffff81190f82:	8a 85 18 ff ff ff    	mov    -0xe8(%rbp),%al
	console_owner =3D NULL;
	raw_spin_unlock(&console_owner_lock);
ffffffff81190f88:	48 c7 c7 e0 96 95 82 	mov    $0xffffffff829596e0,%rdi
ffffffff81190f8f:	41 c6 07 f8          	movb   $0xf8,(%r15)
{
	int waiter;

	raw_spin_lock(&console_owner_lock);
	waiter =3D READ_ONCE(console_waiter);
	console_owner =3D NULL;
ffffffff81190f93:	48 c7 05 c2 bb 04 03 	movq   $0x0,0x304bbc2(%rip)        =
# ffffffff841dcb60 <console_owner>
ffffffff81190f9a:	00 00 00 00 =

static int console_lock_spinning_disable_and_check(void)
{
	int waiter;

	raw_spin_lock(&console_owner_lock);
	waiter =3D READ_ONCE(console_waiter);
ffffffff81190f9e:	88 85 e0 fe ff ff    	mov    %al,-0x120(%rbp)
	console_owner =3D NULL;
	raw_spin_unlock(&console_owner_lock);
ffffffff81190fa4:	e8 9b bf da 00       	callq  ffffffff81f3cf44 <_raw_spin_=
unlock>
ffffffff81190fa9:	48 8b 9d f0 fe ff ff 	mov    -0x110(%rbp),%rbx

	if (!waiter) {
ffffffff81190fb0:	8a 85 e0 fe ff ff    	mov    -0x120(%rbp),%al
ffffffff81190fb6:	81 e3 00 02 00 00    	and    $0x200,%ebx
ffffffff81190fbc:	84 c0                	test   %al,%al
ffffffff81190fbe:	0f 85 54 05 00 00    	jne    ffffffff81191518 <console_un=
lock+0x774>
		spin_release(&console_owner_dep_map, 1, _THIS_IP_);
ffffffff81190fc4:	e8 a8 80 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190fc9:	48 c7 c2 c4 0f 19 81 	mov    $0xffffffff81190fc4,%rdx
ffffffff81190fd0:	be 01 00 00 00       	mov    $0x1,%esi
ffffffff81190fd5:	48 c7 c7 60 97 95 82 	mov    $0xffffffff82959760,%rdi
ffffffff81190fdc:	e8 0d 19 fe ff       	callq  ffffffff811728ee <lock_relea=
se>
		if (console_lock_spinning_disable_and_check()) {
			printk_safe_exit_irqrestore(flags);
			return;
		}

		printk_safe_exit_irqrestore(flags);
ffffffff81190fe1:	e8 82 2d 00 00       	callq  ffffffff81193d68 <__printk_s=
afe_exit>
ffffffff81190fe6:	48 85 db             	test   %rbx,%rbx
ffffffff81190fe9:	0f 85 d6 05 00 00    	jne    ffffffff811915c5 <console_un=
lock+0x821>
ffffffff81190fef:	e8 7d 80 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81190ff4:	48 8b bd f0 fe ff ff 	mov    -0x110(%rbp),%rdi
ffffffff81190ffb:	e8 48 ca ff ff       	callq  ffffffff8118da48 <arch_local=
_irq_restore>
ffffffff81191000:	e8 42 9f fd ff       	callq  ffffffff8116af47 <trace_hard=
irqs_off>

		if (do_cond_resched)
ffffffff81191005:	e8 67 80 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff8119100a:	83 bd cc fe ff ff 00 	cmpl   $0x0,-0x134(%rbp)
ffffffff81191011:	74 1d                	je     ffffffff81191030 <console_un=
lock+0x28c>
			cond_resched();
ffffffff81191013:	e8 59 80 08 00       	callq  ffffffff81219071 <__sanitize=
r_cov_trace_pc>
ffffffff81191018:	31 d2                	xor    %edx,%edx
ffffffff8119101a:	be 5a 09 00 00       	mov    $0x95a,%esi
ffffffff8119101f:	48 c7 c7 00 65 07 82 	mov    $0xffffffff82076500,%rdi
ffffffff81191026:	e8 91 77 fa ff       	callq  ffffffff811387bc <___might_s=
leep>
ffffffff8119102b:	e8 43 66 da 00       	callq  ffffffff81f37673 <_cond_resc=
hed>

--===============4272078859013845910==--

