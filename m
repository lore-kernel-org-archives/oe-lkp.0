Content-Type: multipart/mixed; boundary="===============4447115701604923510=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 17:42:50 +0100
Message-ID: <20150309164249.GA24910@gmail.com>
In-Reply-To: <CAK1hOcNU+8BtCN2TR6ZBh3KTTJtFKdoTe36UfVb91AYxEmeqTg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4447115701604923510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Denys Vlasenko <vda.linux@googlemail.com> wrote:

> On Mon, Mar 9, 2015 at 12:46 PM, Ingo Molnar <mingo@kernel.org> wrote:
> >
> > * Andy Lutomirski <luto@amacapital.net> wrote:
> >
> >> >>      */
> >> >>     unsigned long        stack[64];
> >> >>
> >> >> Last I checked, 0x100 !=3D 64.  Also, wow, this is kind of disgusti=
ng. :)
> >> >
> >> >
> >> > Seems to be unused: I commented it out on "defconfig" build
> >> > and got no build errors.
> >>
> >> It's used.  On 32-bit, NMIs don't use task gates (I don't know why),
> >
> > So task gates were a sexy hardware acceleration feature, eons ago, and
> > we used to rely on them a lot,
> =

> IIRC task gates weren't used in Linux at first, [...]

AFAIK task gates were used to demo i386 context switching between =

tasks, a certain famous ABABABAB... pair of tasks printing to the =

console :-)

So task gates were used for context switching in Linux before it was =

called Linux! :-)

Check out the first released version:

  https://www.kernel.org/pub/linux/kernel/Historic/linux-0.01.tar.gz

It already does:

/*
 *      switch_to(n) should switch tasks to task nr n, first
 * checking that n isn't the current task, in which case it does nothing.
 * This also clears the TS-flag if the task we switched to has used
 * tha math co-processor latest.
 */
#define switch_to(n) {\
struct {long a,b;} __tmp; \
__asm__("cmpl %%ecx,_current\n\t" \
        "je 1f\n\t" \
        "xchgl %%ecx,_current\n\t" \
        "movw %%dx,%1\n\t" \
        "ljmp %0\n\t" \
        "cmpl %%ecx,%2\n\t" \
        "jne 1f\n\t" \
        "clts\n" \
        "1:" \
        ::"m" (*&__tmp.a),"m" (*&__tmp.b), \
        "m" (last_task_used_math),"d" _TSS(n),"c" ((long) task[n])); \
}

That LJMP is the TSS switch.

And in kernel/sched.c we did:

  void sched_init(void)
  {
        int i;
        struct desc_struct * p;

        set_tss_desc(gdt+FIRST_TSS_ENTRY,&(init_task.task.tss));

:-)

Thanks,

	Ingo

--===============4447115701604923510==--

