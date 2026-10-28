Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793164663;
	b=Rvf6ugOmK51qKYO7rfNtnm/y1Er0qRwtqDDqcVA31qpaFLl7M2nxd54QmYjMWCg3ggdJ
	 ktqiLeGpPDRH6mAIUiPC7Ws+Q9+A4Kkk4iU1RIvdZHARiW5mjhX8G0e2DB56CFwOhhL8I
	 4HtzwQ5ddfRGkkNePCPZoXjZlFdS7McVMxA4dwiEzeLlrOd+sOegJn/jWc493yyGTCh8Q
	 N5Twa14AlOiMo975woI3yZGwLqHqiYhMFVcsLT+j7yCSA2IpcIRLNfO3k/Zoxk+9TWtUk
	 zm88bVpjeggoa3DWukWaSoXZ4E4NId0X1UXvwCDQRQPNHzajNMtX0qB6iRkaXkr6wfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GDKL8ACSPYbMdc5hsGwzwbLgkI4rfLvSaTomsxOJ7Rk=;
	b=H5sP1OKIIDX7+Opdz6dcEbrzVbSSL4wsJSQ+Z35BZi/3phI6xjDpVFXeGs2ZqvWOQvTZ
	 rw3BT1QvryYWAb3duEj9OhktLPEsQKR1+pskPlvf4FmeSO8uDYqIkJZVXrPC42lv11j/n
	 DpuV1MzVXY+cB8xktxxyIP+O/5wcj6rjjHHo65oYjzH6rzHlbR7/EIhD0chhplf4EEib6
	 8msZVLzPUtdE59YzRp77WFgtN2A6tQw0v99hQ0/Md50NSqLcZbqYTNRK7VMBjKN8pTWie
	 GUgjNx7YujdokzfTEh+2kc+Q7v/wlNJePa6xDLtf0qA+8MU/JJrSlzAX6hwCQKexFNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V2EqbN3m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEB9606A31D
	for <oe-lkp@lists.linux.dev>; Wed, 28 Oct 2026 05:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BEB9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V2EqbN3m
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5337c7b9937so194611cf.0
        for <oe-lkp@lists.linux.dev>; Tue, 27 Oct 2026 22:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793164661; cv=none;
        d=google.com; s=arc-20260327;
        b=gMhdVnIS6W8rzXw3W2C7PDUneGWEH0JxtEZBs3mn4xvmV9IVnRxeGvmw8/j1C7DllH
         h5gng0vgOevr9GALFnLsXa3UgOti3qrAoC1QkPz9p5plztpVxel+bpPmH08H7YQ2iNH5
         i6bjHiR+BgogmSYMUgFXrPB0D2Ksr3DmSStm9MtdHBNSOHetHT6MCU49XiYaBFAwIR9I
         pKNYhKFSox5yQR65EtE/kO2x7dgp+L27aN5ve3Yk3TZ3x75RSZvrcM1duE1c0oUylDLD
         wqR7Og7/6Ca797uGvS/xK2M86AyEjf5VUfhZ0m5m/UQ2KupubSHHqLxOmBE8qourY09g
         eOiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDKL8ACSPYbMdc5hsGwzwbLgkI4rfLvSaTomsxOJ7Rk=;
        fh=BP2LsnD59hHQ60DGsqOp0n5sX4Q3a5TOPjW5+QAI/v4=;
        b=FoVHiYCjCDjm2hYWD1b9u2Z6NtuExjK2UmhyFceJwZIeQznMLIeC4bANfGX1bycMpe
         CAC4HZs0a3d02Lq875r3Fuxxa3+ePpY8V7J6azVDmesrCjCSHF4XEsfY/HSjZCBVHwn4
         VrLyyE+NVA6y1l5GrUvJ/9VbgCp0we1q6GK29iBy/9zzUqWYvOaUk5V1jPbvzKAYhsw7
         9N2hDrK+22FbNjBZUDo9oMrQSGVQ50RoAaFeymCZwqRJSmaaDuo8wgunIb+vkkAn4giQ
         k9ltSY+ShD1pAANkjfHuls6Lqj1n+6zLc8tiCW8LNOgo4hz3KVRO2H7sD9p2cpcT0RhL
         aS3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793164661; x=1793769461; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDKL8ACSPYbMdc5hsGwzwbLgkI4rfLvSaTomsxOJ7Rk=;
        b=V2EqbN3mHLfXfdYNM3eW8vjRxeZmQwbz7ku5Yk4SI1X3J/I++6g8P/7Dffz90YQ+Gp
         JbfCD0GZzjgjR2gxXR0tGU188ghx/8PeQ9tHavu3BW1aB++2YbBPOqWlOBgtlX16ZCON
         7GMmJA05qGzFBnBRVtYJd99fU8NSdAeYvRAFLHiS8qfMF1OO2Zira9HSZRTlM0O5fAeS
         JUJ1ZBuDv69X1HKnPd3S6CJvOx/vHnr1gWwfIk47GSUmj35y2FDUa0UwonqGCheWj7Ba
         jvdUmpasCFp+gnjHNmqbMacewWGOBsfhI26wJCTfHfxrPT0w2+oBw1lV6kItvj6zPLfi
         RwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164661; x=1793769461;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDKL8ACSPYbMdc5hsGwzwbLgkI4rfLvSaTomsxOJ7Rk=;
        b=u4WXlabFaA/96o6lhunYCbKF/9hv75iM35yGNJAqTZ2+xISZicmKjgqieKxXV7GP+a
         +gmV1eFjVR7P9GDVJOfC1bsn4l6VG962t6bAerMoL6EiLGaIcOJexNBnaBbeX+6qCS5U
         WwMwEU4xsPs4vcpBvfZVK+8/tjpOKMWB6WCada8zMWS0NpmLwWkJ3hofI4vc+Kbvf3w/
         HNCIYfZJwlhqSP00FF4Uow7HoJ2/0Z3ATn/T3IddsFwr8t50PCz9PfmV45RxI47TQTlZ
         evdhedcov1i8yxIXfcuGTlckx8G43GVehsKVR4iFTAb6anRBeHOoLzbFAdu2SMG7fbEM
         r1wg==
X-Gm-Message-State: AFq9FYItryCmqVBs/HeBXyZa6YDMsrPu6qxS0c4UOUqpV1YDw+jOlaNX
	yVlA+paTtFxmDT4l1YbCZzADp0K/2yNOSwohH+GHFwFAv5hRTIZjlnz9WzfeXTWkdBOmc5m7OTD
	GsiP+qDaMmVEUj/AOE6QOrthu+3Xesan7l/8DNvUY
X-Gm-Gg: AYBFou3zkIQENBi5QfJHEj96ZSPaifa/fm/ewNbAzM1O5NeRXO7hqcfGWgDFuEkjxU3
	RT8pSkJtEeVsqUQOQFhs6h6/xdoNffb2fLCwqpkDh+Amx9jl3hK5cx8Rc94chgEoqLE6uicoYYA
	I4AgjXdX3BC8baBkmwEezCI0zvd0xiwiEtSv/3qinX50ljF1LG5bW3m3KiT4Y4Ac+Klf3x+J1jm
	L/+bq8X57C79ZvmJt4OgQ3HePPQ0i5snse6/xaqgzyfCZaEBvnLQCMHO6kqJ8sjj49TT6ipsyZh
	kM4bwwxYRq+8DG2udQLsbvjP06r9sZOVUSkrKcfm/I4DyRUt0FMXzuPpq8uonjENlB0JaLvGgAd
	rhot4UphXUDRfJ5lbGbkUTUvPaP6Ig56JZFSMeMkRspeRrAxJy6dHa/gl
X-Received: by 2002:a05:622a:4119:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-53ff3cb02b4mr6485831cf.7.1793164660595; Tue, 27 Oct 2026
 22:17:40 -0700 (PDT)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202610271934.fd287c3f-lkp@intel.com> <CAJuCfpG67sV5Vhn1DnAWTV2xZVptOCdmH3iEnUEvYs9GRPbOeg@mail.gmail.com>
In-Reply-To: <CAJuCfpG67sV5Vhn1DnAWTV2xZVptOCdmH3iEnUEvYs9GRPbOeg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 27 Oct 2026 22:17:28 -0700
X-Gm-Features: AclHuK86VLRen4xrSLePLZdR0AyyfK7lbNEkSzdjf0kj7NdStnby2nfNoH9JMbE
Message-ID: <CAJuCfpHEDeyWYUp73Va9Gmobpeg0r9vXEFkCtJunGsQSh=gXpA@mail.gmail.com>
Subject: Re: [linus:master] [selftests/proc] ca5480fb53: kselftests.proc.proc-maps-race.fail
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Pedro Falcato <pfalcato@suse.de>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 9:52=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Tue, Oct 27, 2026 at 5:31=E2=80=AFAM kernel test robot <yi1.lai@intel.=
com> wrote:
> >
> >
> >
> > Hello,
> >
> > kernel test robot noticed "kselftests.proc.proc-maps-race.fail" on:
> >
> > commit: ca5480fb53fa73cb5816b696b103826daedab1ca ("selftests/proc: add =
/proc/pid/smaps_rollup tearing tests") https://git.kernel.org/cgit/linux/ke=
rnel/git/torvalds/linux.git master
> >
> > [test failed on linux-next/master f1ac44c32cba88ad65dcecd4a279661d14e93=
651]
> >
> > in testcase: kselftests
> > version: kselftests-x86_64-d6d3455d8751-1_20261013
> > with following parameters:
> >
> >   group: proc
> >
> >
> > config: x86_64-rhel-9.4-kselftests
> > compiler: gcc-14
> > test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-9980XE CPU @ 3.=
00GHz (Skylake) with 32G memory
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <yi1.lai@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202610271934.fd287c3f-lkp@inte=
l.com
> >
> >
> > KERNEL SELFTESTS: linux_headers_dir is /usr/src/linux-headers-x86_64-rh=
el-9.4-kselftests-ca5480fb53fa73cb5816b696b103826daedab1ca
> > 2026-10-26 14:37:46 sed -i s/default_timeout=3D45/default_timeout=3D300=
/ kselftest/runner.sh
> > 2026-10-26 14:37:46 make -j36 TARGETS=3Dproc run_tests
> >   CC       fd-001-lookup
> >   CC       fd-002-posix-eq
> >   CC       fd-003-kthread
> >   CC       proc-2-is-kthread
> >   CC       proc-loadavg-001
> >   CC       proc-maps-race
> >   CC       proc-net-dev-lseek
> >   CC       proc-empty-vm
> >   CC       proc-self-map-files-001
> >   CC       proc-pid-vm
> >   CC       proc-self-map-files-002
> >   CC       proc-self-isnt-kthread
> >   CC       proc-self-syscall
> >   CC       proc-self-wchan
> >   CC       proc-subset-pid
> >   CC       proc-uptime-001
> >   CC       proc-uptime-002
> >   CC       read
> >   CC       proc-tid0
> >   CC       self
> >   CC       setns-dcache
> >   CC       setns-sysvipc
> >   CC       thread-self
> >   CC       proc-multiple-procfs
> >   CC       proc-fsconfig-hidepid
> >   CC       proc-pidns
> > # timeout set to 300
> > # selftests: proc: fd-001-lookup
> > ok 1 selftests: proc: fd-001-lookup
> > # timeout set to 300
> > # selftests: proc: fd-002-posix-eq
> > ok 2 selftests: proc: fd-002-posix-eq
> > # timeout set to 300
> > # selftests: proc: fd-003-kthread
> > ok 3 selftests: proc: fd-003-kthread
> > # timeout set to 300
> > # selftests: proc: proc-2-is-kthread
> > ok 4 selftests: proc: proc-2-is-kthread
> > # timeout set to 300
> > # selftests: proc: proc-loadavg-001
> > ok 5 selftests: proc: proc-loadavg-001
> > # timeout set to 300
> > # selftests: proc: proc-maps-race
> > # TAP version 13
> > # 1..6
> > # # Starting 6 tests from 2 test cases.
> > # #  RUN           proc_maps_race.maps.test_maps_tearing_from_split ...
> > # #            OK  proc_maps_race.maps.test_maps_tearing_from_split
> > # ok 1 proc_maps_race.maps.test_maps_tearing_from_split
> > # #  RUN           proc_maps_race.maps.test_maps_tearing_from_resize ..=
.
> > # #            OK  proc_maps_race.maps.test_maps_tearing_from_resize
> > # ok 2 proc_maps_race.maps.test_maps_tearing_from_resize
> > # #  RUN           proc_maps_race.maps.test_maps_tearing_from_remap ...
> > # #            OK  proc_maps_race.maps.test_maps_tearing_from_remap
> > # ok 3 proc_maps_race.maps.test_maps_tearing_from_remap
> > # #  RUN           proc_maps_race.smaps.test_maps_tearing_from_split ..=
.
> > # Expected stats:                                                      =
       Rss 892 kB
> > #                                                              Pss 82 k=
B
> > #                                                        Pss_Dirty 82 k=
B
> > #                                                         Pss_Anon 54 k=
B
> > #                                                         Pss_File 24 k=
B
> > #                                                        Pss_Shmem 3 kB
> > #                                                     Shared_Clean 0 kB
> > #                                                     Shared_Dirty 860 =
kB
> > #                                                    Private_Clean 0 kB
> > #                                                    Private_Dirty 32 k=
B
> > #                                                       Referenced 892 =
kB
> > #                                                        Anonymous 120 =
kB
> > #                                                              KSM 0 kB
> > #                                                         LazyFree 0 kB
> > #                                                    AnonHugePages 0 kB
> > #                                                   ShmemPmdMapped 0 kB
> > #                                                    FilePmdMapped 0 kB
> > #                                                   Shared_Hugetlb 0 kB
> > #                                                  Private_Hugetlb 0 kB
> > #                                                             Swap 0 kB
> > #                                                          SwapPss 0 kB
> > #                                                           Locked 0 kB
> > # Actual stats:                                                        =
     Rss 892 kB
> > #                                                              Pss 81 k=
B
>
> Hmm. RSS is staying the same but PSS is changing. I think I must
> filter out PSS stats in this comparison because they depend on page
> mapcount and might change even if VMA tree is stable. I will update
> the test to exclude that metric and will post the fixup later today.

Andrew, David,
I posted a fix at
https://lore.kernel.org/all/20261028051312.1505295-1-surenb@google.com/.
Could you please take it as a hotfix?
Thanks,
Suren.

>
> > #                                                        Pss_Dirty 81 k=
B
> > #                                                         Pss_Anon 54 k=
B
> > #                                                         Pss_File 24 k=
B
> > #                                                        Pss_Shmem 3 kB
> > #                                                     Shared_Clean 0 kB
> > #                                                     Shared_Dirty 860 =
kB
> > #                                                    Private_Clean 0 kB
> > #                                                    Private_Dirty 32 k=
B
> > #                                                       Referenced 892 =
kB
> > #                                                        Anonymous 120 =
kB
> > #                                                              KSM 0 kB
> > #                                                         LazyFree 0 kB
> > #                                                    AnonHugePages 0 kB
> > #                                                   ShmemPmdMapped 0 kB
> > #                                                    FilePmdMapped 0 kB
> > #                                                   Shared_Hugetlb 0 kB
> > #                                                  Private_Hugetlb 0 kB
> > #                                                             Swap 0 kB
> > #                                                          SwapPss 0 kB
> > #                                                           Locked 0 kB
> > # # proc-maps-race.c:961:test_maps_tearing_from_split:Expected 0 (0) !=
=3D compare_smaps_rollup(self, &orig_stats, &stats) (0) # # test_maps_teari=
ng_from_split: Test terminated by timeout
> > # #          FAIL  proc_maps_race.smaps.test_maps_tearing_from_split
> > # not ok 4 proc_maps_race.smaps.test_maps_tearing_from_split
> > # #  RUN           proc_maps_race.smaps.test_maps_tearing_from_resize .=
..
> > # Expected stats:                                                      =
       Rss 956 kB
> > #                                                              Pss 83 k=
B
> > #                                                        Pss_Dirty 83 k=
B
> > #                                                         Pss_Anon 54 k=
B
> > #                                                         Pss_File 26 k=
B
> > #                                                        Pss_Shmem 3 kB
> > #                                                     Shared_Clean 0 kB
> > #                                                     Shared_Dirty 924 =
kB
> > #                                                    Private_Clean 0 kB
> > #                                                    Private_Dirty 32 k=
B
> > #                                                       Referenced 956 =
kB
> > #                                                        Anonymous 120 =
kB
> > #                                                              KSM 0 kB
> > #                                                         LazyFree 0 kB
> > #                                                    AnonHugePages 0 kB
> > #                                                   ShmemPmdMapped 0 kB
> > #                                                    FilePmdMapped 0 kB
> > #                                                   Shared_Hugetlb 0 kB
> > #                                                  Private_Hugetlb 0 kB
> > #                                                             Swap 0 kB
> > #                                                          SwapPss 0 kB
> > #                                                           Locked 0 kB
> > # Actual stats:                                                        =
     Rss 956 kB
> > #                                                              Pss 83 k=
B
> > #                                                        Pss_Dirty 83 k=
B
> > #                                                         Pss_Anon 54 k=
B
> > #                                                         Pss_File 25 k=
B
> > #                                                        Pss_Shmem 3 kB
> > #                                                     Shared_Clean 0 kB
> > #                                                     Shared_Dirty 924 =
kB
> > #                                                    Private_Clean 0 kB
> > #                                                    Private_Dirty 32 k=
B
> > #                                                       Referenced 956 =
kB
> > #                                                        Anonymous 120 =
kB
> > #                                                              KSM 0 kB
> > #                                                         LazyFree 0 kB
> > #                                                    AnonHugePages 0 kB
> > #                                                   ShmemPmdMapped 0 kB
> > #                                                    FilePmdMapped 0 kB
> > #                                                   Shared_Hugetlb 0 kB
> > #                                                  Private_Hugetlb 0 kB
> > #                                                             Swap 0 kB
> > #                                                          SwapPss 0 kB
> > #                                                           Locked 0 kB
> > # # proc-maps-race.c:1050:test_maps_tearing_from_resize:Expected 0 (0) =
!=3D compare_smaps_rollup(self, &orig_stats, &stats) (0) # # test_maps_tear=
ing_from_resize: Test terminated by timeout
> > # #          FAIL  proc_maps_race.smaps.test_maps_tearing_from_resize
> > # not ok 5 proc_maps_race.smaps.test_maps_tearing_from_resize
> > # #  RUN           proc_maps_race.smaps.test_maps_tearing_from_remap ..=
.
> > # Expected stats:                                                      =
       Rss 956 kB
> > #                                                              Pss 84 k=
B
> > #                                                        Pss_Dirty 84 k=
B
> > #                                                         Pss_Anon 54 k=
B
> > #                                                         Pss_File 26 k=
B
> > #                                                        Pss_Shmem 3 kB
> > #                                                     Shared_Clean 0 kB
> > #                                                     Shared_Dirty 924 =
kB
> > #                                                    Private_Clean 0 kB
> > #                                                    Private_Dirty 32 k=
B
> > #                                                       Referenced 956 =
kB
> > #                                                        Anonymous 120 =
kB
> > #                                                              KSM 0 kB
> > #                                                         LazyFree 0 kB
> > #                                                    AnonHugePages 0 kB
> > #                                                   ShmemPmdMapped 0 kB
> > #                                                    FilePmdMapped 0 kB
> > #                                                   Shared_Hugetlb 0 kB
> > #                                                  Private_Hugetlb 0 kB
> > #                                                             Swap 0 kB
> > #                                                          SwapPss 0 kB
> > #                                                           Locked 0 kB
> > # Actual stats:                                                        =
     Rss 956 kB
> > #                                                              Pss 83 k=
B
> > #                                                        Pss_Dirty 83 k=
B
> > #                                                         Pss_Anon 54 k=
B
> > #                                                         Pss_File 26 k=
B
> > #                                                        Pss_Shmem 3 kB
> > #                                                     Shared_Clean 0 kB
> > #                                                     Shared_Dirty 924 =
kB
> > #                                                    Private_Clean 0 kB
> > #                                                    Private_Dirty 32 k=
B
> > #                                                       Referenced 956 =
kB
> > #                                                        Anonymous 120 =
kB
> > #                                                              KSM 0 kB
> > #                                                         LazyFree 0 kB
> > #                                                    AnonHugePages 0 kB
> > #                                                   ShmemPmdMapped 0 kB
> > #                                                    FilePmdMapped 0 kB
> > #                                                   Shared_Hugetlb 0 kB
> > #                                                  Private_Hugetlb 0 kB
> > #                                                             Swap 0 kB
> > #                                                          SwapPss 0 kB
> > #                                                           Locked 0 kB
> > # # proc-maps-race.c:1141:test_maps_tearing_from_remap:Expected 0 (0) !=
=3D compare_smaps_rollup(self, &orig_stats, &stats) (0) # # test_maps_teari=
ng_from_remap: Test terminated by timeout
> > # #          FAIL  proc_maps_race.smaps.test_maps_tearing_from_remap
> > # not ok 6 proc_maps_race.smaps.test_maps_tearing_from_remap
> > # # FAILED: 3 / 6 tests passed.
> > # # Totals: pass:3 fail:3 xfail:0 xpass:0 skip:0 error:0 not ok 6 selft=
ests: proc: proc-maps-race # exit=3D1 # timeout set to 300 # selftests: pro=
c: proc-net-dev-lseek ok 7 selftests: proc: proc-net-dev-lseek # timeout se=
t to 300 # selftests: proc: proc-empty-vm # protection_key_support: error: =
rv -1, errno 28 not ok 8 selftests: proc: proc-empty-vm # exit=3D1 # timeou=
t set to 300 # selftests: proc: proc-pid-vm ok 9 selftests: proc: proc-pid-=
vm # timeout set to 300 # selftests: proc: proc-self-map-files-001 ok 10 se=
lftests: proc: proc-self-map-files-001 # timeout set to 300 # selftests: pr=
oc: proc-self-map-files-002 ok 11 selftests: proc: proc-self-map-files-002 =
# timeout set to 300 # selftests: proc: proc-self-isnt-kthread ok 12 selfte=
sts: proc: proc-self-isnt-kthread # timeout set to 300 # selftests: proc: p=
roc-self-syscall ok 13 selftests: proc: proc-self-syscall # timeout set to =
300 # selftests: proc: proc-self-wchan ok 14 selftests: proc: proc-self-wch=
an # timeout set to 300 # selftests: proc: proc-subset-pid ok 15 selftests:=
 proc: proc-subset-pid # timeout set to 300 # selftests: proc: proc-tid0 ok=
 16 selftests: proc: proc-tid0 # timeout set to 300 # selftests: proc: proc=
-uptime-001 ok 17 selftests: proc: proc-uptime-001 # timeout set to 300 # s=
elftests: proc: proc-uptime-002 ok 18 selftests: proc: proc-uptime-002 # ti=
meout set to 300 # selftests: proc: read ok 19 selftests: proc: read # time=
out set to 300 # selftests: proc: self ok 20 selftests: proc: self # timeou=
t set to 300 # selftests: proc: setns-dcache ok 21 selftests: proc: setns-d=
cache # timeout set to 300 # selftests: proc: setns-sysvipc ok 22 selftests=
: proc: setns-sysvipc # timeout set to 300 # selftests: proc: thread-self o=
k 23 selftests: proc: thread-self # timeout set to 300 # selftests: proc: p=
roc-multiple-procfs ok 24 selftests: proc: proc-multiple-procfs # timeout s=
et to 300 # selftests: proc: proc-fsconfig-hidepid ok 25 selftests: proc: p=
roc-fsconfig-hidepid # timeout set to 300 # selftests: proc: proc-pidns # T=
AP version 13 # 1..6 # # Starting 6 tests from 1 test cases.
> > # #  RUN           ns.pidns_mount_string_path ...
> > # #            OK  ns.pidns_mount_string_path
> > # ok 1 ns.pidns_mount_string_path
> > # #  RUN           ns.pidns_fsconfig_string_path ...
> > # #            OK  ns.pidns_fsconfig_string_path
> > # ok 2 ns.pidns_fsconfig_string_path
> > # #  RUN           ns.pidns_fsconfig_fd ...
> > # #            OK  ns.pidns_fsconfig_fd
> > # ok 3 ns.pidns_fsconfig_fd
> > # #  RUN           ns.pidns_reconfigure_remount ...
> > # #            OK  ns.pidns_reconfigure_remount
> > # ok 4 ns.pidns_reconfigure_remount
> > # #  RUN           ns.pidns_reconfigure_fsconfig_string_path ...
> > # #            OK  ns.pidns_reconfigure_fsconfig_string_path
> > # ok 5 ns.pidns_reconfigure_fsconfig_string_path
> > # #  RUN           ns.pidns_reconfigure_fsconfig_fd ...
> > # #            OK  ns.pidns_reconfigure_fsconfig_fd
> > # ok 6 ns.pidns_reconfigure_fsconfig_fd
> > # # PASSED: 6 / 6 tests passed.
> > # # Totals: pass:6 fail:0 xfail:0 xpass:0 skip:0 error:0 ok 26 selftest=
s: proc: proc-pidns
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20261027/202610271934.fd287c3f-=
lkp@intel.com
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
