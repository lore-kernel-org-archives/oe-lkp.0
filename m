Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793851092;
	b=rWD/j2eycWoDWsqfYkjQ3M2iUIVcLTb+mxVrwP5X0iQPUfZtkAO/nGekxTWgtXpydZ3R
	 8B+Kg/We1MXZJH6H3PFe+LvdCyFfcEGNPKkKCMYQDSd0mZv7ViCyU6ED4kYTR+hdXK+JF
	 Q3t7Ezh0pRI8X3co3ERZ2V+yCdymQeWGgS5VOo+JKFL280Sje/XaupDwYG8g0zx2x8+IF
	 lGrJT9KaraU8GMnRNDvOzxMVrdkovfjyQFRTzeRVuwOPHF1yQcCzmMT9QawFReA6X8ObU
	 VmSLZY7obzDd77Tj0vb3UyQMeI4SEZ1zUPX3EzYPbMNm3hdSkVJuogj290JbZx5vqOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
	b=oRSCaz/Kwo0y5xO/lhVeGgbpuOwRxbnACXhcwrpmexz7wy0hU+SU8LpPMEHul1XleTJw
	 94OKHg/2qQcazRNFB2EY5PXILlyngBILQ9zkT2WSfclqGIFoMhLKzZm+ybyYkzyqO/XRc
	 XuxPqGS52B+6GwwUYjrCh1m+vmrfJrbwU3NoBjng7It74u/cNHlLCHnx8YRyQfaaVFkMA
	 AVN2CViRKH37AAW0zw95u06ZHC9nuac9nzEOGkpn/yAyf40ZyNsyvNxZoCoZBHnJpOp1X
	 PXAI7sJczE+Pb2yPw6YPmsAHQdblADYTDp5hVK5kJXo0743p0Zhl61xS/0enxdgwdrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BD44+XVW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E11E606A32C
	for <oe-lkp@lists.linux.dev>; Thu,  5 Nov 2026 03:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E11E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BD44+XVW
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535f598d126so98431cf.1
        for <oe-lkp@lists.linux.dev>; Wed, 04 Nov 2026 19:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793851090; cv=none;
        d=google.com; s=arc-20260327;
        b=K7hxc7C+xPK2kNDQy/D/NP2Vw5GoFkE6xLOF3iGFHE60t9zpSSXrEl1h8PpCVvstMo
         6z+j/sQO7g39g6GdA61ydZlYt9GJP4nxdhvv6/8GVWRh6SDD/uN2uxixM1T5ymrh6qgJ
         iFDTruaEo2ci0CJp7+SA88wAy9GYYjVhz6Q9FrGm81FPaU6HYOQstjKGRR2WrlNblHu6
         gIEdrne67hZECyjS+2cf2K0A2S/9a1Vt//r6bTftmyRgT6Gb60WNzM6hY6QR6jM2iBtK
         fhkYxxJ1umjZoifhz86JJLnAFnIUcndAzMLqPd1boNDjmjGHhK3A88At8VZCwJSDYbrL
         RVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
        fh=LP5yGXYys/5qaqCdfRZ/wFbm2RPErBAen47NNlU/i9U=;
        b=KGc1W2H6rB4D4F2SO+TE54iEux8Cr7rbbUGEAIjY0JLU2TgFpBsQDNdFK03bHG8uJ1
         1q46J8tvUsr1YhSrFFmq2PnH8RyHc7HXfi2bG1F5QeA7awLkXGUcWC+cwOcMs9r39R0i
         ve+nj+clRmzfP0CWlbh5fccsWIcqUl8zpWRWFaynbUtzl3jzFzsCCQx56tvMDfx7l9iR
         zRhnHUhPiOQSApBh1fAXIhQWFlFA80bn5n3tVFkDYEsI8duQyruW1ZibPFIboP+/QsJ6
         FhOHpLnPuQk4kyf5BigYV4lrfo/6iqbuGiamSo4s/lrDySXu1fTVeZEUy+2t98x90sov
         YR6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793851090; x=1794455890; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
        b=BD44+XVWFS3BaFEY4MM1grGuaipp4TN37iVKpIJloNewTSS9fz/YXMr1GD3ZGQg6fn
         LRl6x3caE9SiqXglYxArab1QkdCPgQSgubSuqG1W2NJENFRc/ObkACcQYoU97fkkqumH
         iPlI5uWT8SNn0yjFB8wi613w2anxmpod+dypNhnyPYjQIfm8TA9NFDfQ8DIvPYYMYqS8
         9GF0u0uvCnjkLFp3KpmXWqxmqrHVU4opkEWN53xlGKi2PKjHVf6N4cL5NQ2R4mIKX6Xb
         wZX5K5BK7fq9VVfIG/jPAsmJ0/+f0v5Ztr0A0bcRvghFExrFwuUqtsVNEpexnqltmMg5
         eBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793851090; x=1794455890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ep++7+yqx3z3neXmWb1Nk7vsZAtV36tjaGvf93hHL8g=;
        b=eQB4M+Czysbd1r9h7CV9vqRW1znPKhUU/b2KZ5SPIxbRqf++NB3dqTUXMEYmozJ9pK
         ibX6XxVGO4reV7Hm9Q0rxCUDfliwd0usO1fm1089+rIgQ7QekC1FnrxTZ8KZswEnNpVj
         ZNFPDUkEqOGfUPNO08D/JGojy3pD598JLfJv5fGGEeU1hquiD5kCHqFhX0EBRP3vhmRV
         hC8RA2I9NRM4/+Tu9kJIi826gf027wKjwOQ+yrb68NrUBNO5jYKqFjO9gnNP8U81RgvE
         nO0LPICiQZ1Mj3nPWwQRvCzxh/J0zUnVBff7yFYxD8nUwVHRsZk1hhpHgFbbqC7uaAVe
         gS7A==
X-Gm-Message-State: APuU4Z/XSg2VFmq3Tfu2DmluyghRRYjeh7JTsYgj+WwQgvZkrYZ5uCN5
	+gOOJx7tolk3R5g4yzhNqg3TDuIOO2UyV5yfcRRUtZ+t+Hpdl+8/CS5xefT+w5nj1LNpAOW62fl
	/8qyw971fDNXvh5W+i7i/kI0DNHMHoBrZRD/tkwk9
X-Gm-Gg: AYBFou2MhBVI2ovf4jHbQUdn5LBp0PxhcyEKJLtzqac6nX2Xv0awngI6RjQFG8M+Kxv
	aoRvXYozskT99CabkY/bN5d2fmxDr7g/QwKKy/QdbAyU/1l9VlVDNRn2sj/kYthv5cCZvUK1usF
	j7p8cFGp4tKypVlY0iVexIS63qCGCuJO3YjXByamPgC1I3jpXPFvpmtD7wKcCqixzDuG/s9vT2D
	h6EZYZHHZ5ReYHvH2G+dNVwJ/3RKwyjjgkY/iL/bguvynp6lIHMXCCZCnEHhjqENisasx2dhzrg
	atW90fjFiFH+Pgzq1Xua86iNib+AfjK6pYvaaIDI23EZSUNLho/5fS/fJqR+QtVFVSklwMzpfDC
	K2+U0YsFvp4jQmcODUU9SziAT0y9kGLQ2dALrsQ==
X-Received: by 2002:a05:622a:230a:b0:535:bb33:6351 with SMTP id
 d75a77b69052e-54cad1cbfffmr12692901cf.1.1793851089675; Wed, 04 Nov 2026
 19:58:09 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202611050801.67bb4af4-lkp@intel.com>
In-Reply-To: <202611050801.67bb4af4-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 4 Nov 2026 19:57:57 -0800
X-Gm-Features: AclHuK9ilpld-rB9xe_U790ds1KMqGY3G5aRtH7xf1WpqhhQsTIWBXwTv7iHjtQ
Message-ID: <CAP-5=fVxwRVmaq-kmVVMN9QFmBG56KKVuA0FpP12t45crrGczQ@mail.gmail.com>
Subject: Re: [linus:master] [perf vendor events intel] 3c989481ee: perf-sanity-tests.x86_topdown.topdown_events.fail
To: kernel test robot <yi1.lai@intel.com>, Edward <edward.baker@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	"Taylor, Perry" <perry.taylor@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 5:10=E2=80=AFPM kernel test robot <yi1.lai@intel.com=
> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "perf-sanity-tests.x86_topdown.topdown_events.f=
ail" on:
>
> commit: 3c989481ee3cc22ac5d34e73862a4016af770710 ("perf vendor events int=
el: Update emeraldrapids events from 1.24 to 1.25") https://git.kernel.org/=
cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linux-next/master 7649ba73f9e7e1e04d0b46213e39c79ae09dd55=
c]
>
> in testcase: perf-sanity-tests
> with following parameters:
>
>   perf_compiler: gcc
>   group: group-02
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-14
> test machine: 256 threads 4 sockets INTEL(R) XEON(R) PLATINUM 8592+ (Emer=
ald Rapids) with 256G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202611050801.67bb4af4-lkp@intel.=
com
>
>
> 2026-10-04 03:23:58 sudo ASAN_OPTIONS=3Dfast_unwind_on_malloc=3D0 /usr/sr=
c/linux-perf-x86_64-rhel-9.4-bpf-3c989481ee3cc22ac5d34e73862a4016af770710/t=
ools/perf/perf test 77 -v
>  77: x86 topdown                                                         =
                                      :
>  77.1: topdown events                                                    =
                                      : Running (4 active)
> ---- start ----
> ...
> event syntax error: 'cpu/mem_trans_retired.load_latency/'
>                      \___ Bad event or PMU ...

The blamed commit added the event:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/tools/perf/pmu-events/arch/x86/emeraldrapids/memory.json?id=3D3c989481ee=
3cc22ac5d34e73862a4016af770710
```
...
+        "BriefDescription": "Counts randomly selected loads when the
latency from first dispatch to completion is greater than any number
of cycles.",
+        "Counter": "1,2,3,4,5,6,7",
+        "Data_LA": "1",
+        "EventCode": "0xcd",
+        "EventName": "MEM_TRANS_RETIRED.LOAD_LATENCY",
+        "MSRIndex": "0x3F6",
+        "PublicDescription": "Counts randomly selected loads when the
latency from first dispatch to completion is greater than any number
of cycles. Reported latency may be longer than just the memory
latency.",
+        "SampleAfterValue": "100003",
+        "UMask": "0x1"
+    },
...
```
MSRIndex 0x3F6 is ldlat:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/jevents.py?h=3Dperf-tools-next#n238
and looking at this in the pmu-events-string.c I see:
```
/* offset=3D3016743 */
"mem_trans_retired.load_latency\000memory\000Counts randomly selected
loads when the latency from first dispatch to completion is greater
than any number of cycles  Supports address when
precise\000event=3D0xcd,period=3D100003,umask=3D1,ldlat=3DNone\000\00000\00=
0\000\000\000Counts
randomly selected loads when the latency from first dispatch to
completion is greater than any number of cycles. Reported latency may
be longer than just the memory latency  Supports address when
precise\000"
```
Notice the `ldlat=3DNone`.
In jevents.py we have:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/jevents.py?h=3Dperf-tools-next#n331
```
...
    msr =3D lookup_msr(jd.get('MSRIndex'))
    msrval =3D jd.get('MSRValue')
...
    if msr:
      event +=3D f',{msr}{msrval}'
...
```
So the condition is only testing the msr and not also the msrval,
which is why `None` is placed in the output code.

This output should be in the parse_events output as the failed to
parse None should be somewhere in there like:
```
$ perf stat -e cycles/period=3DNone/ -a sleep 1
event syntax error: 'cycles/period=3DNone/'
                     \___ Bad event or PMU

Unable to find PMU or event on a PMU of 'cycles'

event syntax error: '..les/period=3DNone/'
                                  \___ expected numeric value
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list
available events
```
Anyway, I think it is sensible not to specify a ldlat value when the
MSRValue isn't given. I'll send a patch to jevents.py adding this.

Thanks,
Ian

> event syntax error: '..atency/'
>                                   \___ expected numeric value ...
> event syntax error: '..atency/'
>                                   \___ expected numeric value ...
> WARNING: events were regrouped to match PMUs evlist after sorting/fixing:=
 '{slots,cpu/topdown-bad-spec/}'
> ---- end(-1) ----
>  77.1: topdown events                                                    =
                                      : FAILED!
>  77.2: topdown sorting                                                   =
                                      : Ok
>  77.3: topdown slots injection                                           =
                                      : Ok
>  77.4: topdown metrics_clear no extra slots                              =
                                      : Ok
>
> =3D=3D=3D Test Summary =3D=3D=3D
> Passed main tests : 0
> Passed subtests   : 3
> Skipped tests     : 0
> Failed tests      : 1
> List of failed tests:
>    77.1: topdown events
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20261105/202611050801.67bb4af4-lk=
p@intel.com
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
