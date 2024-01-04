Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5DE107A8
	for <oe-lkp@lists.linux.dev>; Thu,  4 Jan 2024 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkZiQYjI"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5cd51c0e8ebso22675a12.3
        for <oe-lkp@lists.linux.dev>; Wed, 03 Jan 2024 17:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704331989; x=1704936789; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkptymwIcolGBCWQSViAkLeAN8+cobOJ+37e+oCBn8M=;
        b=AkZiQYjIuQOaxzzqdJ+XNp4eat7LNRsiGvYVuKtFzUV8Lx1GdR8st1QaEqUd7p/9gY
         qGsGBl/gPR1/tKivNzX4RhXWV5tRiupWXaqtG/9aWAc4shQ5s2FsE+mRolf0kbfhOtue
         nynDUP861mSXhrELOQOszTtFvoN6ktjsW6LXqN4N4d736rw1YxauQmloa79OvCws2YU/
         2siwBlERkXZR+CiKy5zR5Kd3Ize0ylJJ0RRSZJS82M/pXhq6I2DvG1ZZFTzx7qbIK0vC
         s/wpD5z1UDriE4qfTK7hJcX6or0fnQ2iU2MfnzAMHeEzmbxP77kQAF0GaHciap3+Tx4/
         GtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704331989; x=1704936789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkptymwIcolGBCWQSViAkLeAN8+cobOJ+37e+oCBn8M=;
        b=oUAvga0U/aqaPmFaaLR/mud2SdI2MFixLW461i7DBTYrTlGUB3OuYXR26ofqFS7PLx
         I1VgqRFElPL+zMxlsdyQpNPi6fTo8OTheEw+5q3kZqoBJp8H+eF251Rdx3FX+HKlEaqa
         yLWw5D6W/xfNWyIdHsTzNUNyZS9SH5WpFN86e1J8cke1tjbYQ9V+UINXotzPtW6f4Lfi
         FckXVd36RK1hDShZ06nE5A4gcy3r17szb5sIo3u9eIjguh9mHrK8hMIYdF15HNz/vAAG
         XxuvpV40k2gWiIbpuSM1oq7Sy0emTcMUak1cMRF4Qg9bKxDYct4AlzYQRWrqHNEIMuw4
         ppBw==
X-Gm-Message-State: AOJu0YzaOS30v6V4t/xcg69jJUX8LvMf2GDgSQs5I26QRWazMLgKLLcE
	aPBpYpF7IKVh/OaEUw44CUa2tjMwhu93/v7ld9E=
X-Google-Smtp-Source: AGHT+IFH8MA3VH9B/1LcoFUyQVWZLgqhnBrenWbWB//u91NtAW+irtDyYRK1zRxJIpsMrjEhqk+uFLYmrEbpmpEtXd8=
X-Received: by 2002:a05:6a20:e11f:b0:198:21c5:657f with SMTP id
 kr31-20020a056a20e11f00b0019821c5657fmr1374782pzb.39.1704331989149; Wed, 03
 Jan 2024 17:33:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192310.56367035-oliver.sang@intel.com> <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com> <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com> <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
 <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com> <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com>
In-Reply-To: <988d265a-29a0-4252-9bdc-c47659e336c3@intel.com>
From: Yang Shi <shy828301@gmail.com>
Date: Wed, 3 Jan 2024 17:32:56 -0800
Message-ID: <CAHbLzkq-i4A7XOsBfn_kPKixbt2+9HNeS+DzfjxVrTOcME_HSA@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
To: "Yin, Fengwei" <fengwei.yin@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Christopher Lameter <cl@linux.com>, ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 5:13=E2=80=AFPM Yin, Fengwei <fengwei.yin@intel.com=
> wrote:
>
>
>
> On 12/22/2023 2:11 AM, Yang Shi wrote:
> > On Thu, Dec 21, 2023 at 5:40=E2=80=AFAM Yin, Fengwei <fengwei.yin@intel=
.com> wrote:
> >>
> >>
> >>
> >> On 12/21/2023 8:58 AM, Yin Fengwei wrote:
> >>> But what I am not sure was whether it's worthy to do such kind of cha=
nge
> >>> as the regression only is seen obviously in micro-benchmark. No evide=
nce
> >>> showed the other regressionsin this report is related with madvise. A=
t
> >>> least from the perf statstics. Need to check more on stream/ramspeed.
> >>> Thanks.
> >>
> >> With debugging patch (filter out the stack mapping from THP aligned),
> >> the result of stream can be restored to around 2%:
> >>
> >> commit:
> >>     30749e6fbb3d391a7939ac347e9612afe8c26e94
> >>     1111d46b5cbad57486e7a3fab75888accac2f072
> >>     89f60532d82b9ecd39303a74589f76e4758f176f  -> 1111d46b5cbad with
> >> debugging patch
> >>
> >> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 89f60532d82b9ecd39303a745=
89
> >> ---------------- --------------------------- -------------------------=
--
> >>       350993           -15.6%     296081 =C2=B1  2%      -1.5%     345=
689
> >>     stream.add_bandwidth_MBps
> >>       349830           -16.1%     293492 =C2=B1  2%      -2.3%     341=
860 =C2=B1
> >> 2%  stream.add_bandwidth_MBps_harmonicMean
> >>       333973           -20.5%     265439 =C2=B1  3%      -1.7%     328=
403
> >>     stream.copy_bandwidth_MBps
> >>       332930           -21.7%     260548 =C2=B1  3%      -2.5%     324=
711 =C2=B1
> >> 2%  stream.copy_bandwidth_MBps_harmonicMean
> >>       302788           -16.2%     253817 =C2=B1  2%      -1.4%     298=
421
> >>     stream.scale_bandwidth_MBps
> >>       302157           -17.1%     250577 =C2=B1  2%      -2.0%     296=
054
> >>     stream.scale_bandwidth_MBps_harmonicMean
> >>       339047           -12.1%     298061            -1.4%     334206
> >>     stream.triad_bandwidth_MBps
> >>       338186           -12.4%     296218            -2.0%     331469
> >>     stream.triad_bandwidth_MBps_harmonicMean
> >>
> >>
> >> The regression of ramspeed is still there.
> >
> > Thanks for the debugging patch and the test. If no one has objection
> > to honor MAP_STACK, I'm going to come up with a more formal patch.
> > Even though thp_get_unmapped_area() is not called for MAP_STACK, stack
> > area still may be allocated at 2M aligned address theoretically. And
> > it may be worse with multi-sized THP, for 1M.
> Right. Filtering out MAP_STACK can't make sure no THP for stack. Just
> reduce the possibility of using THP for stack.

Can you please help test the below patch?

diff --git a/include/linux/mman.h b/include/linux/mman.h
index 40d94411d492..dc7048824be8 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -156,6 +156,7 @@ calc_vm_flag_bits(unsigned long flags)
        return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
               _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
               _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
+              _calc_vm_trans(flags, MAP_STACK,      VM_NOHUGEPAGE) |
               arch_calc_vm_flag_bits(flags);
 }

But I can't reproduce the pthread regression on my aarch64 VM. It
might be due to the guard stack (the 64K guard stack is at 2M aligned,
the 8M stack is right next to it which starts at 2M + 64K). But I can
see the stack area is not THP eligible anymore with this patch. See:

fffd18e10000-fffd19610000 rw-p 00000000 00:00 0
Size:               8192 kB
KernelPageSize:        4 kB
MMUPageSize:           4 kB
Rss:                  12 kB
Pss:                  12 kB
Pss_Dirty:            12 kB
Shared_Clean:          0 kB
Shared_Dirty:          0 kB
Private_Clean:         0 kB
Private_Dirty:        12 kB
Referenced:           12 kB
Anonymous:            12 kB
KSM:                   0 kB
LazyFree:              0 kB
AnonHugePages:         0 kB
ShmemPmdMapped:        0 kB
FilePmdMapped:         0 kB
Shared_Hugetlb:        0 kB
Private_Hugetlb:       0 kB
Swap:                  0 kB
SwapPss:               0 kB
Locked:                0 kB
THPeligible:           0
VmFlags: rd wr mr mw me ac nh

The "nh" flag is set.

>
> >
> > Do you have any instructions regarding how to run ramspeed? Anyway I
> > may not have time debug it until after holidays.
> 0Day leverages phoronix-test-suite to run ramspeed. So I don't have
> direct answer here.
>
> I suppose we could check the configuration of ramspeed in phoronix-test-
> suite to understand what's the build options and command options to run
> ramspeed:
> https://openbenchmarking.org/test/pts/ramspeed

Downloaded the test suite. It looks phronix just runs test 3 (int) and
6 (float). They basically does 4 sub tests to benchmark memory
bandwidth:

 * copy
 * scale copy
 * add copy
 * triad copy

The source buffer is initialized (page fault is triggered), but the
destination area is not. So the page fault + page clear time is
accounted to the result. Clearing huge page may take a little bit more
time. But I didn't see noticeable regression on my aarch64 VM either.
Anyway I'm supposed such test should be run with THP off.

>
>
> Regards
> Yin, Fengwei
>
> >
> >>
> >>
> >> Regards
> >> Yin, Fengwei
