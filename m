Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EEA2D03B
	for <oe-lkp@lists.linux.dev>; Sat,  1 Jun 2024 23:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717285337; cv=none; b=dxtOAOxT1iZbp3phub3D+U5n3+L5sNwl2hshVMUGCm0S4mC5uXgc6JVsz9hJ5YSUIjFJXxtpuhKmfHlhhM0PPV/uOS3hW1ivUNcj6FTIZiCE/Dv97NgJizHLvLDGRVhj38nMC32wDWuZlLmUXz44y5xmZwt2fHta1KaHB9edGd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717285337; c=relaxed/simple;
	bh=C2Q025JMLBUpEvDub0Jr4L+GYZtY0NIqdi04qiUDKj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKeq0Dj6rs25CUXEIQ54T3+UBsNEOllt97SQnntDnZVGyPE0J2siR10RqxvgaIHPO/BhJraIuQnWy1IDZT/XSPEpyasZzfT/jSFlwCzMquLLRuZj+YGfxFU9dGGy59ikef+yUm9jxiZ5L4j4ljyMoMtTTR8OeDCpEwGR1cKBW/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ea6E7rCA; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ea6E7rCA"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-df7722171bcso3140003276.3
        for <oe-lkp@lists.linux.dev>; Sat, 01 Jun 2024 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717285335; x=1717890135; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2VjXVhUCGCHmfFYj3yySMRcvIBBQycaqVGy43LOv5E=;
        b=ea6E7rCAp3bRZTh6qxy5OUvoZv4UpwJ7OX9UznVDmaMMBvxtHDCh9yOPwq0g6G58zN
         xBvVFZ6r2bfNtMyNoKp8YNv3164R4XKoPjbklCzSN4ZVeFz4YEtXVeRIwSJv6LE6yAaT
         qx1xMJuS1kq/WleEdDHnTmeLcgJvQtP+gGqwmSL6haFXKSG8p+QL7JRsqDqAcJr0rgeL
         MBM1LhpIYvvDt4cGzUzO6CNTVonh2E8UuvCt1S/z/udAbfWBk/WR5tfD1WDijKzRhtWv
         ZpmJxxSmzSX+xe8Kv9K1nlcArtNkSepKa76YioRPAx9WOgj26juThr0HclE3Jzpyzqvv
         MRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717285335; x=1717890135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2VjXVhUCGCHmfFYj3yySMRcvIBBQycaqVGy43LOv5E=;
        b=I/Kd+xm7yCZZwvD5AQijWyq/IdLf0tj3M53D+Dd4nLqzWdiK2R872Qx6etHK9zwkJ3
         jYRSZS/nem55WvMyDw+IcVaf3gTbNlmciaJx/GrcldAhxxsYhNrHypQi4/Dpy1tQ1Qgm
         0ABIMK3vYd20vZRMixVy0l13NQH+evhNNejnnX1u4V4iLEVRzeZ4YqNeVNBD563tQaYA
         GfVAHhpcnaOl+9DgNKBzdMkCLoyYaernIX90c3khp4JG90FmaO2idpSTh8WhvKqO+BPE
         Xe+Rq9+7s4GpKu0G2arcc/rt6RQv4RRH+9TY9h2Gf568HR/Wj8Mf4c6lfA8FtRBYRJrU
         us8Q==
X-Gm-Message-State: AOJu0Yz4L6vQhu2wrB+2oaMdyPrmkCUjc3QmQXfojnxJ09kL7hT1/tZH
	uVLsRyD7GDGpyAUB7uXEOcYLRkiK/Tb2h2FYo53AGARVRopbMWTuGIxYkkbDRYUP79yQ2o4vlcB
	bemHMyygAv4puUAZlsB7hin7m3l/KjvYAV/FZ
X-Google-Smtp-Source: AGHT+IEl4vnZ3pzG1hXqHO2yqb4gyLo7eBZ2QoeXYV/IxwRNnYdGLHckW+xfm36exV4q/JFhnT+rgPF0y38W3UruBkM=
X-Received: by 2002:a25:c5c8:0:b0:dfa:498d:cd7c with SMTP id
 3f1490d57ef6-dfa73bfad46mr5834958276.18.1717285334817; Sat, 01 Jun 2024
 16:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405271029.6d2f9c4c-lkp@intel.com>
In-Reply-To: <202405271029.6d2f9c4c-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 1 Jun 2024 16:42:03 -0700
Message-ID: <CAJuCfpHjMWj+SEUpFKk+p39NVmK1QEUhTh-g6VQciDC_jQR2Tg@mail.gmail.com>
Subject: Re: [linus:master] [mm] cc92eba1c8: WARNING:at_kernel/rcu/tree_plugin.h:#__rcu_read_unlock
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Kees Cook <keescook@chromium.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Benno Lossin <benno.lossin@proton.me>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Christoph Lameter <cl@linux.com>, Dennis Zhou <dennis@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024 at 7:57=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "WARNING:at_kernel/rcu/tree_plugin.h:#__rcu_rea=
d_unlock" on:
>
> commit: cc92eba1c88b1f74e0f044df2738f4e4b22f1e4e ("mm: fix non-compound m=
ulti-order memory accounting in __free_pages")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linus/master      6d69b6c12fce479fde7bc06f686212451688a10=
2]
> [test failed on linux-next/master 3689b0ef08b70e4e03b82ebd37730a03a672853=
a]
>
> in testcase: boot
>
> compiler: clang-18
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202405271029.6d2f9c4c-lkp@intel.=
com

Fix is posted at
https://lore.kernel.org/all/20240601233840.617458-1-surenb@google.com/

>
>
> [    2.504179][    C0] ------------[ cut here ]------------
> [ 2.506222][ C0] WARNING: CPU: 0 PID: 1 at kernel/rcu/tree_plugin.h:431 _=
_rcu_read_unlock (kernel/rcu/tree_plugin.h:431)
> [    2.508117][    C0] Modules linked in:
> [    2.509538][    C0] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc=
4-00080-gcc92eba1c88b #1 1899fb0438e1349d8761ad4016a94aaeaa8a37df
> [    2.512111][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [ 2.518194][ C0] RIP: 0010:__rcu_read_unlock (kernel/rcu/tree_plugin.h:43=
1)
> [ 2.520109][ C0] Code: 00 00 41 83 3e 00 75 26 43 0f b6 04 3c 84 c0 75 5f=
 8b 03 3d 00 00 00 40 73 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc cc=
 <0f> 0b eb ec e8 8d 00 00 00 eb d3 89 d9 80 e1 07 80 c1 03 38 c1 7c
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   00 00                   add    %al,(%rax)
>    2:   41 83 3e 00             cmpl   $0x0,(%r14)
>    6:   75 26                   jne    0x2e
>    8:   43 0f b6 04 3c          movzbl (%r12,%r15,1),%eax
>    d:   84 c0                   test   %al,%al
>    f:   75 5f                   jne    0x70
>   11:   8b 03                   mov    (%rbx),%eax
>   13:   3d 00 00 00 40          cmp    $0x40000000,%eax
>   18:   73 10                   jae    0x2a
>   1a:   5b                      pop    %rbx
>   1b:   41 5c                   pop    %r12
>   1d:   41 5d                   pop    %r13
>   1f:   41 5e                   pop    %r14
>   21:   41 5f                   pop    %r15
>   23:   5d                      pop    %rbp
>   24:   c3                      ret
>   25:   cc                      int3
>   26:   cc                      int3
>   27:   cc                      int3
>   28:   cc                      int3
>   29:   cc                      int3
>   2a:*  0f 0b                   ud2             <-- trapping instruction
>   2c:   eb ec                   jmp    0x1a
>   2e:   e8 8d 00 00 00          call   0xc0
>   33:   eb d3                   jmp    0x8
>   35:   89 d9                   mov    %ebx,%ecx
>   37:   80 e1 07                and    $0x7,%cl
>   3a:   80 c1 03                add    $0x3,%cl
>   3d:   38 c1                   cmp    %al,%cl
>   3f:   7c                      .byte 0x7c
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   0f 0b                   ud2
>    2:   eb ec                   jmp    0xfffffffffffffff0
>    4:   e8 8d 00 00 00          call   0x96
>    9:   eb d3                   jmp    0xffffffffffffffde
>    b:   89 d9                   mov    %ebx,%ecx
>    d:   80 e1 07                and    $0x7,%cl
>   10:   80 c1 03                add    $0x3,%cl
>   13:   38 c1                   cmp    %al,%cl
>   15:   7c                      .byte 0x7c
> [    2.524112][    C0] RSP: 0000:ffff8883ae809db8 EFLAGS: 00010286
> [    2.526188][    C0] RAX: 00000000ffffffff RBX: ffff888100ac04ac RCX: d=
ffffc0000000000
> [    2.528109][    C0] RDX: dffffc0000000000 RSI: 0000000000000008 RDI: f=
fff888100ac0040
> [    2.530810][    C0] RBP: 00000000ffffffff R08: ffffffff878bc007 R09: 1=
ffffffff0f17800
> [    2.532116][    C0] R10: dffffc0000000000 R11: fffffbfff0f17801 R12: 1=
ffff11020158095
> [    2.534888][    C0] R13: dffffc0000000000 R14: ffffea0004037400 R15: d=
ffffc0000000000
> [    2.536108][    C0] FS:  0000000000000000(0000) GS:ffff8883ae800000(00=
00) knlGS:0000000000000000
> [    2.539082][    C0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    2.540110][    C0] CR2: ffff88843ffff000 CR3: 00000000056ce000 CR4: 0=
0000000000406f0
> [    2.542812][    C0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [    2.544109][    C0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [    2.546833][    C0] Call Trace:
> [    2.548013][    C0]  <IRQ>
> [ 2.548772][ C0] ? __warn (kernel/panic.c:240 kernel/panic.c:694)
> [ 2.550219][ C0] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:431)
> [ 2.551982][ C0] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:431)
> [ 2.553266][ C0] ? report_bug (lib/bug.c:?)
> [ 2.555068][ C0] ? handle_bug (arch/x86/kernel/traps.c:239)
> [ 2.556133][ C0] ? exc_invalid_op (arch/x86/kernel/traps.c:260)
> [ 2.557753][ C0] ? asm_exc_invalid_op (arch/x86/include/asm/idtentry.h:62=
1)
> [ 2.559780][ C0] ? __rcu_read_unlock (kernel/rcu/tree_plugin.h:431)
> [ 2.561383][ C0] page_ext_put (include/linux/rcupdate.h:339 include/linux=
/rcupdate.h:814 mm/page_ext.c:537)
> [ 2.562887][ C0] __free_pages (include/linux/page_ref.h:210 include/linux=
/mm.h:1135 mm/page_alloc.c:4669)
> [ 2.564182][ C0] ? __pfx_thread_stack_free_rcu (kernel/fork.c:346)
> [ 2.566080][ C0] ? rcu_core (kernel/rcu/tree.c:?)
> [ 2.567681][ C0] rcu_core (include/linux/rcupdate.h:339 kernel/rcu/tree.c=
:2198 kernel/rcu/tree.c:2471)
> [ 2.569661][ C0] __do_softirq (arch/x86/include/asm/jump_label.h:27 inclu=
de/linux/jump_label.h:207 include/trace/events/irq.h:142 kernel/softirq.c:5=
55)
> [ 2.571612][ C0] ? __irq_exit_rcu (kernel/softirq.c:613 kernel/softirq.c:=
635)
> [ 2.573327][ C0] __irq_exit_rcu (kernel/softirq.c:613 kernel/softirq.c:63=
5)
> [ 2.574888][ C0] irq_exit_rcu (kernel/softirq.c:647)
> [ 2.576112][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c=
:1043)
> [    2.578091][    C0]  </IRQ>
> [    2.579130][    C0]  <TASK>
> [ 2.580154][ C0] asm_sysvec_apic_timer_interrupt (arch/x86/include/asm/id=
tentry.h:702)
> [ 2.582143][ C0] RIP: 0010:clear_page_rep (arch/x86/lib/clear_page_64.S:2=
0)
> [ 2.583920][ C0] Code: 1f 46 c0 fd e9 26 ff ff ff cc cc cc cc cc cc cc cc=
 cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 b9 00 02 00 00 31 c0=
 <f3> 48 ab c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   1f                      (bad)
>    1:   46 c0 fd e9             rex.RX sar $0xe9,%bpl
>    5:   26 ff                   es (bad)
>    7:   ff                      (bad)
>    8:   ff cc                   dec    %esp
>    a:   cc                      int3
>    b:   cc                      int3
>    c:   cc                      int3
>    d:   cc                      int3
>    e:   cc                      int3
>    f:   cc                      int3
>   10:   cc                      int3
>   11:   cc                      int3
>   12:   cc                      int3
>   13:   90                      nop
>   14:   90                      nop
>   15:   90                      nop
>   16:   90                      nop
>   17:   90                      nop
>   18:   90                      nop
>   19:   90                      nop
>   1a:   90                      nop
>   1b:   90                      nop
>   1c:   90                      nop
>   1d:   90                      nop
>   1e:   90                      nop
>   1f:   90                      nop
>   20:   90                      nop
>   21:   90                      nop
>   22:   90                      nop
>   23:   b9 00 02 00 00          mov    $0x200,%ecx
>   28:   31 c0                   xor    %eax,%eax
>   2a:*  f3 48 ab                rep stos %rax,%es:(%rdi)                <=
-- trapping instruction
>   2d:   c3                      ret
>   2e:   cc                      int3
>   2f:   cc                      int3
>   30:   cc                      int3
>   31:   cc                      int3
>   32:   90                      nop
>   33:   90                      nop
>   34:   90                      nop
>   35:   90                      nop
>   36:   90                      nop
>   37:   90                      nop
>   38:   90                      nop
>   39:   90                      nop
>   3a:   90                      nop
>   3b:   90                      nop
>   3c:   90                      nop
>   3d:   90                      nop
>   3e:   90                      nop
>   3f:   90                      nop
>
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:   f3 48 ab                rep stos %rax,%es:(%rdi)
>    3:   c3                      ret
>    4:   cc                      int3
>    5:   cc                      int3
>    6:   cc                      int3
>    7:   cc                      int3
>    8:   90                      nop
>    9:   90                      nop
>    a:   90                      nop
>    b:   90                      nop
>    c:   90                      nop
>    d:   90                      nop
>    e:   90                      nop
>    f:   90                      nop
>   10:   90                      nop
>   11:   90                      nop
>   12:   90                      nop
>   13:   90                      nop
>   14:   90                      nop
>   15:   90                      nop
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20240527/202405271029.6d2f9c4c-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
