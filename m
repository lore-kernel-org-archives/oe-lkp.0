Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8C291864
	for <oe-lkp@lists.linux.dev>; Fri, 23 Jan 2026 16:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769184369; cv=pass; b=WAw4L05Mxm5FOz5OP1go7DmUT/YgdixzNpx1yv5esAhQEsNizJKukmeSB+3zZb9IFYD9w+4FSAh+7Ffqa19JqwmUG/PxvEesdt1LxHXzjsh889RT9K28kAt2g9U2tBlhTBHKcxxoBLOZO3nLiaTFAl/YOFmEnVlsC29ptimassU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769184369; c=relaxed/simple;
	bh=Aiyi5d0K/9zq3YFVUBCQiaSB0kfsIiMcXZGfLis/1K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rol+zk8HOPCoviqL6eXZWesoEUFOFEfLukUPkjOTc7ixTNCUsfhI1jafCGwHbts4TBuHgGyE+YgovZWLTrHh7afix4QTzqJMQHeoBEgXUXBVh99qJojt3NGSFiSgYLRDij3xRPk12HXxpGen2BMuPSZdmnoxVOBUQZB1RofqJ8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u5i1nBoJ; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u5i1nBoJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a1462573caso126535ad.0
        for <oe-lkp@lists.linux.dev>; Fri, 23 Jan 2026 08:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769184367; cv=none;
        d=google.com; s=arc-20240605;
        b=B2ZMFjLlUvILO7FXtRgxPWCwrromK70/jWD1PANQS2hXYC9y8ERrLfC/Dx3Z+c1tZ2
         MRBw0FmbvksIrt2fQLYrlvbvOiQ8yfoUNj4IgVcxoJs+eyFMAerAfKA/OZ+9PyBKZk7q
         xII2inZNnv680kcf1aS+gVwU0SRlN4di7pzDeNiyKD4fNF5SPU04yd/Z2joYMRm/DD1B
         mihTs6B4bhT4NU1wdl/KzPzKmf6a08VFP82vttR1DbtY6ePo5AjhbenEc/NvjYT8y38b
         TTt79DzxiThvrVGAZy3wW/Q1U2GmLh+mPeuv3kMftfdyaV5eBck4zxxJ72ygv2h3ltD3
         lLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUf55GSzcxpJ8bR6cYAmb5RH0IPojW3QPrajdrImmYE=;
        fh=l8rOiqtSLEqWd36vG+s96g5zO66hYb2AyMYeqPnq36M=;
        b=j+UN24bj6hzeOKO8o306uW5eM5LSSL50jcRf7IQR426PVhhX2zYw2t7Duj+hQOl7Ww
         TP3tpxi/0llVxnua+wDutecCEC1XctdXxdeW5D+xkpng71//TaksoOtQ1GdyjHuij8zu
         /C+hdqEknQWGIoi0TGYgqpRYpnc8h9XX/Qr6cfLq12CfBUzekQVEaWg+jjs/P6Eb+m5s
         LU1K9wswsU929bskc1Ed3aeOhml83z0I5X0jGLSxdX1MKRkCQ3FAzGetfoRaO5VzLVIe
         F1/42C8x8Rn/l6Z6XlASOqlvUFxw0jYJH365oeJxeT6XbRmiozfg1Z+nvpZP899+xfv2
         sm6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769184367; x=1769789167; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUf55GSzcxpJ8bR6cYAmb5RH0IPojW3QPrajdrImmYE=;
        b=u5i1nBoJI97FiVyewMt1v8VvFUNohpfIxDUYamJSdm+UggC+hc0AW4LSeJfNz6DG5Y
         hLhfiCXdZ/gecLqJFD5oQPgVWNQu4r82fg8vMNAagYpQ4UtGgqslM81XeXLFhu13TLBU
         xkrZ4g9VelbCnNIUlOGU2FVRxso1+kUq5qd7WeUj9u+9VzMCJ66Wmy9+3votm8O9wNVQ
         r6t9l212G87Di1GB7EOGFHYYwWJkoatFW2ONbxJ7DDJraVtMKQ2c1BKOP6j6fNiqsh7o
         EcrvG+bmlVjRY8gk/XYeu6B57MVVUvTnCEew2D3zevh9iPKCTGieRMI4dmzmQO9HC6sl
         V7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184367; x=1769789167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AUf55GSzcxpJ8bR6cYAmb5RH0IPojW3QPrajdrImmYE=;
        b=Odkv2mlOa9xvuNPXNkyzGeE9eMvTl+JuO9JhlN0P9QUBTK6yXTfPwgH3q7xG7ZH9hV
         Hvx4hyjbSi+dhzjGic4R9oWtkzUC9PG87hvG2fdkMugPsuwKrVLXsdbPzpsNlSFQvw9d
         62mgLQszI8j8gnkbCUJLpCcVPxLTcEQiedcK8lgiABe0AeYbo3kpuUpu5Pedv35LdAiB
         pFmqK9ZXEtKyMSowfbPYRhpVhuJ7snE8gASx50SjB1/N1A8ayreB7FXu/IlRAWvxRB3J
         8clp60OhqKeDZj9Dim8bcUWND1Wy4UNp9X2pxWvTfoUxejSeXdIeY0GxcKLQOHH6PdKe
         p9/w==
X-Forwarded-Encrypted: i=1; AJvYcCVW57WdvkclfRug8TYgj6KNkNtY+W2k6qFJz4LrKcgvYrLv7tzYewW0ql8GaWyVH8NAR+FveuM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwjktZaqxCBmRRHGHV0R6EBHo2JeVzMsAaE4klM+IAyiq+o5vws
	D4495BZXJOubikWqfP1SNaqRyWKWTZUt63V0H1BWPa7Tihb0E//Gf40kZEX4+5U7yogCI6dloXw
	1fFihHPOpR8kbrGLvWCNZIy766XhexCK/YLDlL+kG
X-Gm-Gg: AZuq6aLzOwTcd6qUEqHlpYle8/wgtrj4E+1RSNtD6qLFNxO9520kZUQqlLPlEJn7CgK
	mMG6jUAUqIhzUzIKJZjuvn8M4Ny/a7eR71/eSDeA09s0CnSiO3tJCGtXFtmaJR/EWyZFXbLTRQj
	uCT2HDnIoixXNl5+7pTE/jv/wi2KaYBXoDqtD491QsnbW4j0ZMCHheinrije0BiK6tG6JtFfN/9
	/TuZUxRR0dOS/jxVuEPuRudVFtm5VgpuQ8OYzPLxX9i/oLTJL4BWnPNpKlkwotP0gbJZ6/CJLDp
	LUu6IbmToC2upelj29+pW1IXnw==
X-Received: by 2002:a17:902:d48a:b0:2a7:6c4e:5924 with SMTP id
 d9443c01a7336-2a8024e3b26mr2921625ad.12.1769184366737; Fri, 23 Jan 2026
 08:06:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601201519.ce4c3ab3-lkp@intel.com> <CAP-5=fVyGswdFrEw7=P8RGPJP+2wW3qQhzCfz1BoJ9Uvg4iKDg@mail.gmail.com>
 <aXMSjyjjd2PRDpok@xsang-OptiPlex-9020>
In-Reply-To: <aXMSjyjjd2PRDpok@xsang-OptiPlex-9020>
From: Ian Rogers <irogers@google.com>
Date: Fri, 23 Jan 2026 08:05:55 -0800
X-Gm-Features: AZwV_QgvsatnnFM9OQSus_Zabo1eKMl8e47DynS4ExKSVE6Ik4ii_tuY6sNdcgo
Message-ID: <CAP-5=fVPGoh7cf167rSU-5hfC+aQBkHa2=_Pq-1BE9KFMsOasQ@mail.gmail.com>
Subject: Re: [linux-next:master] [perf test subcmd help] ef92c4351e: kmsg.sanitizer.indirect_leak/malloc/___interceptor_backtrace/child_test_sig_handler/raise/abort
To: Oliver Sang <oliver.sang@intel.com>
Cc: Thomas Richter <tmricht@linux.ibm.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Sri Jayaramappa <sjayaram@akamai.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Guilherme Amadio <amadio@gentoo.org>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 10:18=E2=80=AFPM Oliver Sang <oliver.sang@intel.com=
> wrote:
>
>
> hi, Ian Rogers,
>
>
> On Wed, Jan 21, 2026 at 07:52:15AM -0800, Ian Rogers wrote:
>
> [...]
>
> > >     #20 0x55f34aa28241 in _start perf[102f241]
> >
> > I believe this is resolved by:
> > https://lore.kernel.org/lkml/20260121082402.2311962-1-tmricht@linux.ibm=
.com/
> >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D=3D11710=3D=3DERROR: LeakSanitizer: detected memory leaks
> > >
> > > Direct leak of 30952 byte(s) in 3 object(s) allocated from:
> > >     #0 0x7f7688ced610 in calloc ../../../../src/libsanitizer/asan/asa=
n_malloc_linux.cpp:77
> > >     #1 0x7f7688ace808  (/lib/x86_64-linux-gnu/libelf.so.1+0x3808) (Bu=
ildId: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
> > >
> > > Indirect leak of 9280 byte(s) in 3 object(s) allocated from:
> > >     #0 0x7f7688cedc57 in malloc ../../../../src/libsanitizer/asan/asa=
n_malloc_linux.cpp:69
> > >     #1 0x7f7688ad6550  (/lib/x86_64-linux-gnu/libelf.so.1+0xb550) (Bu=
ildId: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
> > >
> > > Indirect leak of 1873 byte(s) in 3 object(s) allocated from:
> > >     #0 0x7f7688cedc57 in malloc ../../../../src/libsanitizer/asan/asa=
n_malloc_linux.cpp:69
> > >     #1 0x7f7688ad73fa  (/lib/x86_64-linux-gnu/libelf.so.1+0xc3fa) (Bu=
ildId: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
> > >
> > > SUMMARY: AddressSanitizer: 42105 byte(s) leaked in 9 allocation(s).
> > >  68.4: Exclude disjoint subcmd names                                 =
: FAILED!
> >
> > To better diagnose these leaks could you disable the fast asan stack un=
winder:
> > ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0
>
> thanks a lot for guidance!
>
> we've made the change according, now see results like below [1]
>
> we will supply these information in future reports. thanks again!

That's for the update, and that's great news! The reports are really
useful so a great win-win.

>
> [1]
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D11725=3D=3DERROR: LeakSanitizer: detected memory leaks
>
> Direct leak of 30952 byte(s) in 3 object(s) allocated from:
>     #0 0x7fed49fb4610 in calloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:77
>     #1 0x7fed49d95808  (/lib/x86_64-linux-gnu/libelf.so.1+0x3808) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>     #2 0x7fed49d965f9  (/lib/x86_64-linux-gnu/libelf.so.1+0x45f9) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>     #3 0x55dc6825e4f7 in symsrc__init util/symbol-elf.c:1164

As the only direct leak this is key here. There's limited detail due
to the inlining but I believe this is the leak fixed here:
https://lore.kernel.org/lkml/20260117052849.2205545-2-irogers@google.com/
and is being carried in the perf-tools-next tree:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/commit/?h=3Dperf-tools-next&id=3D92d65d9c31621befe0a5f7c0bd43bd217613c6b6
It has a fixes tag and so hopefully this means it will flow out nicely
but perhaps it is a candidate for v6.19 rc fixes PR.

Thanks,
Ian

>     #4 0x55dc67ddba50 in dso__load util/symbol.c:1795
>     #5 0x55dc67e6fa86 in map__load util/map.c:351
>     #6 0x55dc67e6fe6d in map__find_symbol util/map.c:385
>     #7 0x55dc67e4480a in __dump_stack util/debug.c:343
>     #8 0x55dc67ad0c84 in child_test_sig_handler tests/builtin-test.c:313
>     #9 0x7fed3fcf2def  (/lib/x86_64-linux-gnu/libc.so.6+0x3fdef) (BuildId=
: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #10 0x7fed3fd4795b  (/lib/x86_64-linux-gnu/libc.so.6+0x9495b) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #11 0x7fed3fcf2cc1 in gsignal (/lib/x86_64-linux-gnu/libc.so.6+0x3fcc=
1) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #12 0x7fed3fcdb4ab in abort (/lib/x86_64-linux-gnu/libc.so.6+0x284ab)=
 (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #13 0x7fed3fcdb41f  (/lib/x86_64-linux-gnu/libc.so.6+0x2841f) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #14 0x55dc67a0ee6f in exclude_cmds /usr/src/perf_selftests-x86_64-rhe=
l-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/lib/subcmd/help.c:=
107
>     #15 0x55dc67bb4645 in test__exclude_cmdnames_no_overlap tests/subcmd-=
help.c:110
>     #16 0x55dc67ad14c4 in run_test_child tests/builtin-test.c:340
>     #17 0x55dc67a22db2 in start_command /usr/src/perf_selftests-x86_64-rh=
el-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/lib/subcmd/run-co=
mmand.c:128
>     #18 0x55dc67ad39a0 in start_test tests/builtin-test.c:545
>     #19 0x55dc67ad490c in __cmd_test tests/builtin-test.c:648
>     #20 0x55dc67ad72bf in cmd_test tests/builtin-test.c:850
>     #21 0x55dc679dca44 in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:349
>     #22 0x55dc679dd335 in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/pe=
rf.c:401
>     #23 0x55dc679dd88b in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:445
>     #24 0x55dc679de032 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:553
>     #25 0x7fed3fcdcca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #26 0x7fed3fcdcd64 in __libc_start_main (/lib/x86_64-linux-gnu/libc.s=
o.6+0x29d64) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #27 0x55dc67742240 in _start (/usr/src/perf_selftests-x86_64-rhel-9.4=
-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf+0x102f240) (B=
uildId: b8c98ab0747f9f1fe41a64089a7488f7aedbc9d8)
>
> Indirect leak of 9280 byte(s) in 3 object(s) allocated from:
>     #0 0x7fed49fb4c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x7fed49d9d550  (/lib/x86_64-linux-gnu/libelf.so.1+0xb550) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>     #2 0x7fed49d9e517  (/lib/x86_64-linux-gnu/libelf.so.1+0xc517) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>     #3 0x7fed49d9e0b1 in elf_rawdata (/lib/x86_64-linux-gnu/libelf.so.1+0=
xc0b1) (BuildId: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>     #4 0x55dc68254770 in elf_section_by_name util/symbol-elf.c:193
>     #5 0x55dc6825d641 in read_gnu_debugdata util/symbol-elf.c:1086
>     #6 0x55dc6825e625 in symsrc__init util/symbol-elf.c:1173
>     #7 0x55dc67ddba50 in dso__load util/symbol.c:1795
>     #8 0x55dc67e6fa86 in map__load util/map.c:351
>     #9 0x55dc67e6fe6d in map__find_symbol util/map.c:385
>     #10 0x55dc67e4480a in __dump_stack util/debug.c:343
>     #11 0x55dc67ad0c84 in child_test_sig_handler tests/builtin-test.c:313
>     #12 0x7fed3fcf2def  (/lib/x86_64-linux-gnu/libc.so.6+0x3fdef) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #13 0x7fed3fd4795b  (/lib/x86_64-linux-gnu/libc.so.6+0x9495b) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #14 0x7fed3fcf2cc1 in gsignal (/lib/x86_64-linux-gnu/libc.so.6+0x3fcc=
1) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7fed3fcdb4ab in abort (/lib/x86_64-linux-gnu/libc.so.6+0x284ab)=
 (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x7fed3fcdb41f  (/lib/x86_64-linux-gnu/libc.so.6+0x2841f) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #17 0x55dc67a0ee6f in exclude_cmds /usr/src/perf_selftests-x86_64-rhe=
l-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/lib/subcmd/help.c:=
107
>     #18 0x55dc67bb4645 in test__exclude_cmdnames_no_overlap tests/subcmd-=
help.c:110
>     #19 0x55dc67ad14c4 in run_test_child tests/builtin-test.c:340
>     #20 0x55dc67a22db2 in start_command /usr/src/perf_selftests-x86_64-rh=
el-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/lib/subcmd/run-co=
mmand.c:128
>     #21 0x55dc67ad39a0 in start_test tests/builtin-test.c:545
>     #22 0x55dc67ad490c in __cmd_test tests/builtin-test.c:648
>     #23 0x55dc67ad72bf in cmd_test tests/builtin-test.c:850
>     #24 0x55dc679dca44 in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:349
>     #25 0x55dc679dd335 in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/pe=
rf.c:401
>     #26 0x55dc679dd88b in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:445
>     #27 0x55dc679de032 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:553
>
> Indirect leak of 1873 byte(s) in 3 object(s) allocated from:
>     #0 0x7fed49fb4c57 in malloc ../../../../src/libsanitizer/asan/asan_ma=
lloc_linux.cpp:69
>     #1 0x7fed49d9e3fa  (/lib/x86_64-linux-gnu/libelf.so.1+0xc3fa) (BuildI=
d: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>     #2 0x7fed49d9e0b1 in elf_rawdata (/lib/x86_64-linux-gnu/libelf.so.1+0=
xc0b1) (BuildId: d6a40be9eadcbcb0562b7bb13bbe81166e82cc40)
>     #3 0x55dc68254770 in elf_section_by_name util/symbol-elf.c:193
>     #4 0x55dc6825d641 in read_gnu_debugdata util/symbol-elf.c:1086
>     #5 0x55dc6825e625 in symsrc__init util/symbol-elf.c:1173
>     #6 0x55dc67ddba50 in dso__load util/symbol.c:1795
>     #7 0x55dc67e6fa86 in map__load util/map.c:351
>     #8 0x55dc67e6fe6d in map__find_symbol util/map.c:385
>     #9 0x55dc67e4480a in __dump_stack util/debug.c:343
>     #10 0x55dc67ad0c84 in child_test_sig_handler tests/builtin-test.c:313
>     #11 0x7fed3fcf2def  (/lib/x86_64-linux-gnu/libc.so.6+0x3fdef) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #12 0x7fed3fd4795b  (/lib/x86_64-linux-gnu/libc.so.6+0x9495b) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #13 0x7fed3fcf2cc1 in gsignal (/lib/x86_64-linux-gnu/libc.so.6+0x3fcc=
1) (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #14 0x7fed3fcdb4ab in abort (/lib/x86_64-linux-gnu/libc.so.6+0x284ab)=
 (BuildId: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #15 0x7fed3fcdb41f  (/lib/x86_64-linux-gnu/libc.so.6+0x2841f) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>     #16 0x55dc67a0ee6f in exclude_cmds /usr/src/perf_selftests-x86_64-rhe=
l-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/lib/subcmd/help.c:=
107
>     #17 0x55dc67bb4645 in test__exclude_cmdnames_no_overlap tests/subcmd-=
help.c:110
>     #18 0x55dc67ad14c4 in run_test_child tests/builtin-test.c:340
>     #19 0x55dc67a22db2 in start_command /usr/src/perf_selftests-x86_64-rh=
el-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/lib/subcmd/run-co=
mmand.c:128
>     #20 0x55dc67ad39a0 in start_test tests/builtin-test.c:545
>     #21 0x55dc67ad490c in __cmd_test tests/builtin-test.c:648
>     #22 0x55dc67ad72bf in cmd_test tests/builtin-test.c:850
>     #23 0x55dc679dca44 in run_builtin /usr/src/perf_selftests-x86_64-rhel=
-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:349
>     #24 0x55dc679dd335 in handle_internal_command /usr/src/perf_selftests=
-x86_64-rhel-9.4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/pe=
rf.c:401
>     #25 0x55dc679dd88b in run_argv /usr/src/perf_selftests-x86_64-rhel-9.=
4-bpf-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:445
>     #26 0x55dc679de032 in main /usr/src/perf_selftests-x86_64-rhel-9.4-bp=
f-ef92c4351ec75bcfb8a1cc3a88109b5339f296ef/tools/perf/perf.c:553
>     #27 0x7fed3fcdcca7  (/lib/x86_64-linux-gnu/libc.so.6+0x29ca7) (BuildI=
d: def5460e3cee00bfee25b429c97bcc4853e5b3a8)
>
> SUMMARY: AddressSanitizer: 42105 byte(s) leaked in 9 allocation(s).
>  68.4: Exclude disjoint subcmd names                                 : FA=
ILED!
>
> >
> > Thanks,
> > Ian
> >
> > > The kernel config and materials to reproduce are available at:
> > > https://download.01.org/0day-ci/archive/20260120/202601201519.ce4c3ab=
3-lkp@intel.com
> > >
> > >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > >
