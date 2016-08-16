Content-Type: multipart/mixed; boundary="===============2989080822252351159=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 17 Aug 2016 08:02:50 +1000
Message-ID: <20160816220250.GI16044@dastard>
In-Reply-To: <CA+55aFwmRPuhLLqN8D-3pcbkqoC05t=1dtnsv8k074uD7QNxBg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2989080822252351159==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 06:51:42PM -0700, Linus Torvalds wrote:
> Anyway, including the direct reclaim call paths gets
> __remove_mapping() a bit higher, and _raw_spin_lock_irqsave climbs to
> 0.26%. But perhaps more importlantly, looking at what __remove_mapping
> actually *does* (apart from the spinlock) gives us:
> =

>  - inside remove_mapping itself (0.11% on its own - flat cost, no
> child accounting)
> =

>     48.50 =E2=94=82       lock   cmpxchg %edx,0x1c(%rbx)
> =

>     so that's about 0.05%
> =

>  - 0.40% __delete_from_page_cache (0.22%
> radix_tree_replace_clear_tags, 0.13%__radix_tree_lookup)
> =

>  - 0.06% workingset_eviction()
> =

> so I'm not actually seeing anything *new* expensive in there. The
> __delete_from_page_cache() overhead may have changed a bit with the
> tagged tree changes, but this doesn't look like memcg.
> =

> But we clearly have very different situations.
> =

> What does your profile show for when you actually dig into
> __remove_mapping() itself?, Looking at your flat profile, I'm assuming
> you get

-   22.26%     0.93%  [kernel]          [k] __remove_mapping
   - 3.86% __remove_mapping
      - 18.35% _raw_spin_lock_irqsave
           __pv_queued_spin_lock_slowpath
        1.32% __delete_from_page_cache
      - 0.92% _raw_spin_unlock_irqrestore
           __raw_callee_save___pv_queued_spin_unlock

And the instruction level profile:

.....
       =EF=BF=BD       xor    %ecx,%ecx
       =EF=BF=BD       mov    %rax,%r15
  0.39 =EF=BF=BD       mov    $0x2,%eax
       =EF=BF=BD       lock   cmpxchg %ecx,0x1c(%rbx)
 32.56 =EF=BF=BD       cmp    $0x2,%eax
       =EF=BF=BD     =EF=BF=BD jne    12e
       =EF=BF=BD       mov    0x20(%rbx),%rax
       =EF=BF=BD       lea    -0x1(%rax),%rdx
  0.39 =EF=BF=BD       test   $0x1,%al
       =EF=BF=BD       cmove  %rbx,%rdx
       =EF=BF=BD       mov    (%rdx),%rax
  0.39 =EF=BF=BD       test   $0x10,%al
       =EF=BF=BD     =EF=BF=BD jne    127
       =EF=BF=BD       mov    (%rbx),%rcx
       =EF=BF=BD       shr    $0xf,%rcx
       =EF=BF=BD       and    $0x1,%ecx
       =EF=BF=BD     =EF=BF=BD jne    14a
       =EF=BF=BD       mov    0x68(%r14),%rax
 36.03 =EF=BF=BD       xor    %esi,%esi
       =EF=BF=BD       test   %r13b,%r13b
       =EF=BF=BD       mov    0x50(%rax),%rdx
  1.16 =EF=BF=BD     =EF=BF=BD jne    e8
  0.96 =EF=BF=BD a9:   mov    %rbx,%rdi
.....

Indicates most time on the cmpxchg for the page ref followed by the
grabbing on the ->freepage op vector:

	freepage =3D mapping->a_ops->freepage;

> I come back to wondering whether maybe you're hitting some PV-lock proble=
m.
> =

> I know queued_spin_lock_slowpath() is ok. I'm not entirely sure
> __pv_queued_spin_lock_slowpath() is.

It's the same code AFAICT, except the pv version jumps straight to
the "queue" case.

> So I'd love to see you try the non-PV case, but I also think it might
> be interesting to see what the instruction profile for
> __pv_queued_spin_lock_slowpath() itself is. They share a lot of code
> (there's some interesting #include games going on to make
> queued_spin_lock_slowpath() actually *be*
> __pv_queued_spin_lock_slowpath() with some magic hooks), but there
> might be issues.

  0.03 =EF=BF=BD       data16 data16 data16 xchg %ax,%ax
       =EF=BF=BD       push   %rbp
  0.00 =EF=BF=BD       mov    %rsp,%rbp
  0.01 =EF=BF=BD       push   %r15
       =EF=BF=BD       push   %r14
       =EF=BF=BD       push   %r13
  0.01 =EF=BF=BD       push   %r12
       =EF=BF=BD       mov    $0x18740,%r12
       =EF=BF=BD       push   %rbx
       =EF=BF=BD       mov    %rdi,%rbx
       =EF=BF=BD       sub    $0x10,%rsp
       =EF=BF=BD       add    %gs:0x7ef0d0e0(%rip),%r12
       =EF=BF=BD       movslq 0xc(%r12),%rax
  0.02 =EF=BF=BD       mov    %gs:0x7ef0d0db(%rip),%r15d
       =EF=BF=BD       add    $0x1,%r15d
       =EF=BF=BD       shl    $0x12,%r15d
       =EF=BF=BD       lea    0x1(%rax),%edx
  0.01 =EF=BF=BD       mov    %edx,0xc(%r12)
       =EF=BF=BD       mov    %eax,%edx
       =EF=BF=BD       shl    $0x4,%rax
       =EF=BF=BD       add    %rax,%r12
       =EF=BF=BD       shl    $0x10,%edx
       =EF=BF=BD       movq   $0x0,(%r12)
  0.02 =EF=BF=BD       or     %edx,%r15d
       =EF=BF=BD       mov    %gs:0x7ef0d0ad(%rip),%eax
  0.00 =EF=BF=BD       movl   $0x0,0x8(%r12)
  0.01 =EF=BF=BD       mov    %eax,0x40(%r12)
       =EF=BF=BD       movb   $0x0,0x44(%r12)
       =EF=BF=BD       mov    (%rdi),%eax
  0.88 =EF=BF=BD       test   %ax,%ax
       =EF=BF=BD     =EF=BF=BD jne    8f
  0.02 =EF=BF=BD       mov    $0x1,%edx
       =EF=BF=BD       lock   cmpxchg %dl,(%rdi)
  0.38 =EF=BF=BD       test   %al,%al
       =EF=BF=BD     =EF=BF=BD je     14a
  0.02 =EF=BF=BD 8f:   mov    %r15d,%eax
       =EF=BF=BD       shr    $0x10,%eax
       =EF=BF=BD       xchg   %ax,0x2(%rbx)
  2.07 =EF=BF=BD       shl    $0x10,%eax
       =EF=BF=BD       test   %eax,%eax
       =EF=BF=BD     =EF=BF=BD jne    171
       =EF=BF=BD       movq   $0x0,-0x30(%rbp)
  0.02 =EF=BF=BD ac:   movzbl 0x44(%r12),%eax
  0.97 =EF=BF=BD       mov    $0x1,%r13d
       =EF=BF=BD       mov    $0x100,%r14d
       =EF=BF=BD       cmp    $0x2,%al
       =EF=BF=BD       sete   %al
       =EF=BF=BD       movzbl %al,%eax
       =EF=BF=BD       mov    %rax,-0x38(%rbp)
  0.00 =EF=BF=BD ca:   movb   $0x0,0x44(%r12)
  0.00 =EF=BF=BD       mov    $0x8000,%edx
       =EF=BF=BD       movb   $0x1,0x1(%rbx)
       =EF=BF=BD     =EF=BF=BD jmp    e6
  0.04 =EF=BF=BD db:   pause
  8.04 =EF=BF=BD       sub    $0x1,%edx
       =EF=BF=BD     =EF=BF=BD je     229
       =EF=BF=BD e6:   movzbl (%rbx),%eax
  7.54 =EF=BF=BD       test   %al,%al
       =EF=BF=BD     =EF=BF=BD jne    db
  0.10 =EF=BF=BD       mov    %r14d,%eax
  0.06 =EF=BF=BD       lock   cmpxchg %r13w,(%rbx)
  2.93 ?       cmp    $0x100,%ax
       =EF=BF=BD     =EF=BF=BD jne    db
       =EF=BF=BD fc:   mov    (%rbx),%edx
  0.37 =EF=BF=BD       mov    $0x1,%ecx
       =EF=BF=BD       or     $0x1,%edx
       =EF=BF=BD     =EF=BF=BD jmp    114
  0.01 =EF=BF=BD108:   mov    %edx,%eax
       =EF=BF=BD       lock   cmpxchg %ecx,(%rbx)
  0.26 =EF=BF=BD       cmp    %edx,%eax
       =EF=BF=BD     =EF=BF=BD je     14a
       =EF=BF=BD       mov    %eax,%edx
       =EF=BF=BD114:   mov    %edx,%eax
  0.00 =EF=BF=BD       xor    %ax,%ax
       =EF=BF=BD       cmp    %r15d,%eax
       =EF=BF=BD     =EF=BF=BD je     108
  0.01 =EF=BF=BD       cmpq   $0x0,-0x30(%rbp)
       ?       movb   $0x1,(%rbx)
       =EF=BF=BD     =EF=BF=BD je     251
       =EF=BF=BD12c:   mov    -0x30(%rbp),%rsi
  0.01 =EF=BF=BD       mov    $0x1,%eax
       =EF=BF=BD       mov    $0x2,%edx
       =EF=BF=BD       movl   $0x1,0x8(%rsi)
  0.11 =EF=BF=BD       lock   cmpxchg %dl,0x44(%rsi)
  2.34 =EF=BF=BD       cmp    $0x1,%al
       =EF=BF=BD     =EF=BF=BD je     160
       =EF=BF=BD14a:   decl   %gs:0x7ef1b5bb(%rip)
  0.02 =EF=BF=BD       add    $0x10,%rsp
       =EF=BF=BD       pop    %rbx
       =EF=BF=BD       pop    %r12
  0.00 =EF=BF=BD       pop    %r13
       =EF=BF=BD       pop    %r14
       =EF=BF=BD       pop    %r15
       =EF=BF=BD       pop    %rbp
       =EF=BF=BD     =EF=BF=BD retq
       =EF=BF=BD160:   mov    -0x30(%rbp),%rsi
       =EF=BF=BD       movb   $0x3,(%rbx)
       =EF=BF=BD       mov    %rbx,%rdi
       =EF=BF=BD       callq  0xffffffff810fcf90
       =EF=BF=BD     =EF=BF=BD jmp    14a
       =EF=BF=BD171:   lea    0x44(%r12),%r14
       =EF=BF=BD       mov    %rax,%r13
       =EF=BF=BD       shr    $0x12,%eax
       =EF=BF=BD       shr    $0xc,%r13
       =EF=BF=BD       sub    $0x1,%eax
       =EF=BF=BD       and    $0x30,%r13d
       =EF=BF=BD       cltq
       =EF=BF=BD       add    $0x18740,%r13
       ?       add    -0x7d8164c0(,%rax,8),%r13
  0.03 =EF=BF=BD       mov    %r12,0x0(%r13)
  0.38 =EF=BF=BD19c:   mov    $0x8000,%eax
       =EF=BF=BD     =EF=BF=BD jmp    1b7
  0.04 =EF=BF=BD1a3:   test   %al,%al
       =EF=BF=BD     =EF=BF=BD jne    1b0
       =EF=BF=BD       movzbl 0x44(%r13),%edx
  1.66 =EF=BF=BD       test   %dl,%dl
       =EF=BF=BD     =EF=BF=BD jne    1f1
  1.75 =EF=BF=BD1b0:   pause
 64.57 =EF=BF=BD       sub    $0x1
  0.04 =EF=BF=BD    =EF=BF=BD  mov    0x8(%r12),%eax
  0.03 =EF=BF=BD    =EF=BF=BD  test   %eax,%eax
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD jne    1d4
       =EF=BF=BD1c9:=EF=BF=BD  pause
       =EF=BF=BD    =EF=BF=BD  mov    0x8(%r12),%eax
       =EF=BF=BD    =EF=BF=BD  test   %eax,%eax
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD je     1c9
       =EF=BF=BD1d4:=EF=BF=BD  mov    (%r12),%rax
       =EF=BF=BD    =EF=BF=BD  test   %rax,%rax
       =EF=BF=BD    =EF=BF=BD  mov    %rax,-0x30(%rbp)
  0.05 =EF=BF=BD    =EF=BF=BD=EF=BF=BD je     ac
       =EF=BF=BD    =EF=BF=BD  mov    -0x30(%rbp),%rax
       =EF=BF=BD    =EF=BF=BD  prefet (%rax)
  0.25 =EF=BF=BD    =EF=BF=BD=EF=BF=BD jmpq   ac
       =EF=BF=BD1f1:=EF=BF=BD  mov    $0x1,%eax
       =EF=BF=BD    =EF=BF=BD  xchg   %al,0x44(%r12)
       =EF=BF=BD    =EF=BF=BD  mov    0x8(%r12),%eax
       =EF=BF=BD    =EF=BF=BD  test   %eax,%eax
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD jne    213
       =EF=BF=BD    =EF=BF=BD  mov    %r14,%rdi
       =EF=BF=BD    =EF=BF=BD  mov    $0x1,%esi
       =EF=BF=BD    =EF=BF=BD  callq  0xffffffff8109f7a0
       =EF=BF=BD    =EF=BF=BD  xchg   %ax,%ax
       =EF=BF=BD213:=EF=BF=BD  mov    $0x1,%eax
       =EF=BF=BD    =EF=BF=BD  xor    %edi,%edi
       =EF=BF=BD    =EF=BF=BD  lock   cmpxchg %dil,(%r14)
       =EF=BF=BD    =EF=BF=BD  mov    0x8(%r12),%eax
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD jmpq   19c
       =EF=BF=BD229:=EF=BF=BD  cmpq   $0x0,-0x38(%rbp)
       =EF=BF=BD    =EF=BF=BD  movb   $0x0,0x1(%rbx)
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD je     276
       =EF=BF=BD234:=EF=BF=BD  movb   $0x1,0x44(%r12)
       =EF=BF=BD    =EF=BF=BD  mov    $0x3,%esi
       =EF=BF=BD    =EF=BF=BD  mov    %rbx,%rdi
       =EF=BF=BD    =EF=BF=BD  callq  0xffffffff8109f7a0
       =EF=BF=BD    =EF=BF=BD  xchg   %ax,%ax
       =EF=BF=BD    =EF=BF=BD  movzbl (%rbx),%eax
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD jmpq   ca
       =EF=BF=BD251:=EF=BF=BD  mov    (%r12),%rax
  0.14 =EF=BF=BD    =EF=BF=BD  test   %rax,%rax
       =EF=BF=BD    =EF=BF=BD  mov    %rax,-0x30(%rbp)
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD jne    12c
       =EF=BF=BD262:=EF=BF=BD  pause
  0.31 =EF=BF=BD    =EF=BF=BD  mov    (%r12),%rax
       =EF=BF=BD    =EF=BF=BD  test   %rax,%rax
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD je     262
       =EF=BF=BD    =EF=BF=BD  mov    %rax,-0x30(%rbp)
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD jmpq   12c
       =EF=BF=BD276:?  mov    %r12,%rsi
       =EF=BF=BD    =EF=BF=BD  mov    %rbx,%rdi
       =EF=BF=BD    =EF=BF=BD  callq  0xffffffff810fcf90
       =EF=BF=BD    =EF=BF=BD  mov    %rax,-0x38(%rbp)
       =EF=BF=BD    =EF=BF=BD  mov    $0x3,%eax
       =EF=BF=BD    =EF=BF=BD  xchg   %al,(%rbx)
       =EF=BF=BD    =EF=BF=BD  test   %al,%al
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD jne    234
       =EF=BF=BD    =EF=BF=BD  mov    -0x38(%rbp),%rax
       =EF=BF=BD    =EF=BF=BD  movb   $0x1,(%rbx)
       =EF=BF=BD    =EF=BF=BD  movq   $0x0,(%rax)
       =EF=BF=BD    =EF=BF=BD=EF=BF=BD=EF=BF=BDjmpq   fc            =


> For example, if you run a virtual 16-core system on a physical machine
> that then doesn't consistently give 16 cores to the virtual machine,
> you'll get no end of hiccups.

I learnt that lesson 6-7 years ago when I first started doing
baseline benchmarking to compare bare metal to virtualised IO
performance.

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============2989080822252351159==--

