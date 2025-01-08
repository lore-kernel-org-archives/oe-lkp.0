Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A11A8F6B
	for <oe-lkp@lists.linux.dev>; Wed,  8 Jan 2025 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352234; cv=none; b=EYDwf1/3d42LYHOwLFZQ1spy8/0Oy4b1tnq+JiHoLFAyCLlTzmVL0TTpym7hSqi8KByKLcqGahRC7DaVjrKuTpeKE7Oq2Q4GHN0L9mjjBB1UK9Bg4pXTERfCRClprbcQMHnenGOgrL4I5EBPjBc545tHG4wt2mArKJpqHpNFsRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352234; c=relaxed/simple;
	bh=amRuKlPJNdq59gW8T0EMy4a8nP3pE8qyOqPWlCp922A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UkfIgNdZfqK4d3OXHPN7UVEEK/0v1PoF3C7lfHgACEWbbwgVFa9viMhb9RGRqGeYoNQKE89lmkRrNg1OjWbuA+4vj+2uX+Po//dI7XuSezk4wDb51yeVK27xFrwAMGqOv4cVQvyQ6V8nEUXpX34Z7hP0gjQvnpzAAatmUiiemZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg6JG1xT; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg6JG1xT"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43626213fffso6722975e9.1
        for <oe-lkp@lists.linux.dev>; Wed, 08 Jan 2025 08:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736352231; x=1736957031; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bC+1J5q7xH7BokG/eMvPi3f8aneMsQgO05LeT7Gf8c=;
        b=Qg6JG1xTkmcULiOivowtePN/ibDNWnPW8t8mHBbcz6cqERdTj/+e+gvnmzSXCgDA1Z
         tI0hrOi45bdCGRa4H9vzyVk7HCKDVilhIZ5bccIrqpOdMOkzWZz4z+Bf5zvTp3e0Qul9
         ovlV4VshRbqAbZcZkZ4W0OeEHA/KhYqCcYv0yx2R7WXViC6twna+v5QtLo7e6NUfHLtV
         Wy9rocB8kBd0Dq4+m6O4Xh1acnTHeT1IKLoaOLdm+Bw2qsaoeU69T1oFyRZsWszIiZNd
         VQwTQBIUVQTXl6ljkj2RmXIJxC4wc1B+s34f7Pdqdg8d26jCPJXYW9BmNfj8brvgvdps
         oJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352231; x=1736957031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bC+1J5q7xH7BokG/eMvPi3f8aneMsQgO05LeT7Gf8c=;
        b=Ruu9wFPFUfnYLF3hrO9Zi1pPPE8J77u6SJj5OYMVIMtKL1xQS1JMfG3s1gWdAlqbCQ
         DOg8g0Vi7ZMT2IXTs/nRDzK2CCaWGWNaGTsULWHIsr9KRCEdUxFauja0mJXvervhTyZ8
         WPy4TdMmYZudsk5KpA+KcgSJBzKRj4VyRblbll+H7krCvhZRHTt9bJ/HQNn97kk59O/S
         aB4m9QoD7JzPvl/aSbNZ4mT8y5SRdIbMQ4su3S9aMGNl/NzZUzHZ/Tu8em275sowBcFQ
         eKsjKMIWYgdl/8wmtowAAx64tCKGmR944wFyss47TPhsEGqjT01SUppVm3Wmheuz/G3Z
         hsQg==
X-Forwarded-Encrypted: i=1; AJvYcCWaJUCjkmAVpjLobY14Pk4qptwhrl5VWNORwZ2d2yWwIoSOuf38TG9P5SFUbKug7ox1YbayudQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOAzFYtEpbR/YPnU/0jtp18Gq/2ABHoCU3GqAuCjV98IXboIHp
	HOQehaNRhAUmf5ieqoVfqvakuOS/6W5ZIfk5MFbVfo4eTv3JNZ9q/Hrg4GUXZq//Hz4fgYQreAL
	n1FoZaUU0wrXp6utY267jmIT7fUY=
X-Gm-Gg: ASbGncu+fQ/iY1IurVZVOxH9UaAIkW4XHDt6/5t8W/aprfTCR6uv6t4IsefCF35zQQS
	TTR/VT47lBAAkdEUldzRbJv/H1vVHP/OD+gvTBxaE
X-Google-Smtp-Source: AGHT+IF92E65/r4RWX4KRWkdjxhiD4sqgKJ0KTaJrPsvWNgbs90f8yFOKr1AKbRoNgb1NB57d+5akrhWo7qLFUJZmSo=
X-Received: by 2002:a5d:64c4:0:b0:385:e90a:b7de with SMTP id
 ffacd0b85a97d-38a85e1f125mr3113087f8f.5.1736352230257; Wed, 08 Jan 2025
 08:03:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501081209.b7d8b735-lkp@intel.com>
In-Reply-To: <202501081209.b7d8b735-lkp@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 8 Jan 2025 17:03:39 +0100
X-Gm-Features: AbW1kvYrk6efBY20yW0ikchoAZJf9YHw-oweGsE9JlJb_0wX1vuj8CHuedrBkjM
Message-ID: <CA+fCnZfkMuk8dtk+5_7DK_h0Pxv_JNgJDL3D-8pBXOByzVOtzQ@mail.gmail.com>
Subject: Re: [linus:master] [kasan] 3738290bfc: kunit.kasan.fail
To: kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>
Cc: Nihar Chaithanya <niharchaithanya@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 8, 2025 at 8:04=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
>
> Hello,
>
>
> we found the new added test kmalloc_track_caller_oob_right randomly faile=
d
> (10 out of 30 runs) which seems due to below (1)
>
> 1857099c18e16a72 3738290bfc99606787f515a4590
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :30          33%          10:30    kunit.kasan.fail
>            :30          33%          10:30    dmesg.BUG:KFENCE:memory_cor=
ruption_in_kmalloc_track_caller_oob_right <-- (1)
>
> below are details.
>
>
> kernel test robot noticed "kunit.kasan.fail" on:
>
> commit: 3738290bfc99606787f515a4590ad38dc4f79ca4 ("kasan: add kunit tests=
 for kmalloc_track_caller, kmalloc_node_track_caller")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [test failed on linus/master      0bc21e701a6ffacfdde7f04f87d664d82e8a13b=
f]
> [test failed on linux-next/master 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac=
2]
>
> in testcase: kunit
> version:
> with following parameters:
>
>         group: group-03
>
>
>
> config: x86_64-rhel-9.4-kunit
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz=
 (Kaby Lake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202501081209.b7d8b735-lkp@intel.=
com
>
>
>
> [  117.724741]     ok 3 kmalloc_node_oob_right
> [  117.724849] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  117.737591] BUG: KASAN: slab-out-of-bounds in kmalloc_track_caller_oob=
_right+0x4ca/0x530 [kasan_test]
> [  117.747467] Write of size 1 at addr ffff888165906078 by task kunit_try=
_catch/3613
>
> [  117.757782] CPU: 7 UID: 0 PID: 3613 Comm: kunit_try_catch Tainted: G  =
  B   W        N 6.12.0-rc6-00221-g3738290bfc99 #1
> [  117.769291] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN, [N]=3DTEST
> [  117.775007] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.0 =
12/22/2016
> [  117.783056] Call Trace:
> [  117.786185]  <TASK>
> [  117.788966]  dump_stack_lvl+0x4f/0x70
> [  117.793307]  print_address_description.constprop.0+0x2c/0x3a0
> [  117.799721]  ? kmalloc_track_caller_oob_right+0x4ca/0x530 [kasan_test]
> [  117.806918]  print_report+0xb9/0x280
> [  117.811183]  ? kasan_addr_to_slab+0x9/0x90
> [  117.815961]  ? kmalloc_track_caller_oob_right+0x4ca/0x530 [kasan_test]
> [  117.823154]  kasan_report+0xcb/0x100
> [  117.827408]  ? kmalloc_track_caller_oob_right+0x4ca/0x530 [kasan_test]
> [  117.834602]  kmalloc_track_caller_oob_right+0x4ca/0x530 [kasan_test]
> [  117.841626]  ? __pfx_kmalloc_track_caller_oob_right+0x10/0x10 [kasan_t=
est]
> [  117.849166]  ? __schedule+0x716/0x15e0
> [  117.853589]  ? ktime_get_ts64+0x7f/0x240
> [  117.858186]  kunit_try_run_case+0x173/0x440
> [  117.863043]  ? try_to_wake_up+0x913/0x1580
> [  117.867813]  ? __pfx_kunit_try_run_case+0x10/0x10
> [  117.873187]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [  117.878915]  ? set_cpus_allowed_ptr+0x81/0xb0
> [  117.883956]  ? __pfx_set_cpus_allowed_ptr+0x10/0x10
> [  117.889502]  ? __pfx_kunit_try_run_case+0x10/0x10
> [  117.894876]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
> [  117.901633]  kunit_generic_run_threadfn_adapter+0x79/0xe0
> [  117.907698]  kthread+0x2d4/0x3c0
> [  117.911604]  ? __pfx_kthread+0x10/0x10
> [  117.916032]  ret_from_fork+0x2d/0x70
> [  117.920291]  ? __pfx_kthread+0x10/0x10
> [  117.924718]  ret_from_fork_asm+0x1a/0x30
> [  117.929324]  </TASK>
>
> [  117.934373] Allocated by task 3613:
> [  117.938544]  kasan_save_stack+0x1c/0x40
> [  117.943062]  kasan_save_track+0x10/0x30
> [  117.947574]  __kasan_kmalloc+0xa6/0xb0
> [  117.951998]  __kmalloc_node_track_caller_noprof+0x1bd/0x470
> [  117.958239]  kmalloc_track_caller_oob_right+0x8c/0x530 [kasan_test]
> [  117.965176]  kunit_try_run_case+0x173/0x440
> [  117.970031]  kunit_generic_run_threadfn_adapter+0x79/0xe0
> [  117.976097]  kthread+0x2d4/0x3c0
> [  117.980000]  ret_from_fork+0x2d/0x70
> [  117.984251]  ret_from_fork_asm+0x1a/0x30
>
> [  117.991022] The buggy address belongs to the object at ffff88816590600=
0
>                 which belongs to the cache kmalloc-128 of size 128
> [  118.004873] The buggy address is located 0 bytes to the right of
>                 allocated 120-byte region [ffff888165906000, ffff88816590=
6078)
>
> [  118.021331] The buggy address belongs to the physical page:
> [  118.027566] page: refcount:1 mapcount:0 mapping:0000000000000000 index=
:0x0 pfn:0x165906
> [  118.036221] head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped=
:0 pincount:0
> [  118.044530] ksm flags: 0x17ffffc0000040(head|node=3D0|zone=3D2|lastcpu=
pid=3D0x1fffff)
> [  118.052494] page_type: f5(slab)
> [  118.056314] raw: 0017ffffc0000040 ffff888100042a00 ffffea00202bd080 00=
00000000000003
> [  118.064708] raw: 0000000000000000 0000000080200020 00000001f5000000 00=
00000000000000
> [  118.073102] head: 0017ffffc0000040 ffff888100042a00 ffffea00202bd080 0=
000000000000003
> [  118.081581] head: 0000000000000000 0000000080200020 00000001f5000000 0=
000000000000000
> [  118.090061] head: 0017ffffc0000001 ffffea0005964181 ffffffffffffffff 0=
000000000000000
> [  118.098541] head: 0000000000000002 0000000000000000 00000000ffffffff 0=
000000000000000
> [  118.107021] page dumped because: kasan: bad access detected
>
> [  118.115431] Memory state around the buggy address:
> [  118.120904]  ffff888165905f00: fa fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
> [  118.128782]  ffff888165905f80: fb fb fb fb fb fb fb fc fc fc fc fc fc =
fc fc fc
> [  118.136658] >ffff888165906000: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 fc
> [  118.144535]                                                           =
      ^
> [  118.152323]  ffff888165906080: fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc
> [  118.160211]  ffff888165906100: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 fc fc
> [  118.168100] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  118.176059]     # kmalloc_track_caller_oob_right: EXPECTATION FAILED a=
t mm/kasan/kasan_test_c.c:243
>                    KASAN failure expected in "ptr[size] =3D 'y'", but non=
e occurred
> [  118.176103] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  118.201544] BUG: KFENCE: memory corruption in kmalloc_track_caller_oob=
_right+0x27b/0x530 [kasan_test]
>
> [  118.213582] Corrupted memory at 0x00000000e59a4b3f [ ! . . . . . . . .=
 . . . . . . . ] (in kfence-#20):
> [  118.223645]  kmalloc_track_caller_oob_right+0x27b/0x530 [kasan_test]
> [  118.230667]  kunit_try_run_case+0x173/0x440
> [  118.235525]  kunit_generic_run_threadfn_adapter+0x79/0xe0
> [  118.241590]  kthread+0x2d4/0x3c0
> [  118.245497]  ret_from_fork+0x2d/0x70
> [  118.249748]  ret_from_fork_asm+0x1a/0x30
>
> [  118.256520] kfence-#20: 0x0000000036299d7e-0x000000000c1813d3, size=3D=
120, cache=3Dkmalloc-128
>
> [  118.267597] allocated by task 3613 on cpu 7 at 118.176015s (0.091581s =
ago):
> [  118.275220]  kmalloc_track_caller_oob_right+0x190/0x530 [kasan_test]
> [  118.282241]  kunit_try_run_case+0x173/0x440
> [  118.287100]  kunit_generic_run_threadfn_adapter+0x79/0xe0
> [  118.293166]  kthread+0x2d4/0x3c0
> [  118.297071]  ret_from_fork+0x2d/0x70
> [  118.301322]  ret_from_fork_asm+0x1a/0x30
>
> [  118.308107] freed by task 3613 on cpu 7 at 118.176094s (0.132012s ago)=
:
> [  118.315381]  kmalloc_track_caller_oob_right+0x27b/0x530 [kasan_test]
> [  118.322403]  kunit_try_run_case+0x173/0x440
> [  118.327260]  kunit_generic_run_threadfn_adapter+0x79/0xe0
> [  118.333327]  kthread+0x2d4/0x3c0
> [  118.337233]  ret_from_fork+0x2d/0x70
> [  118.341482]  ret_from_fork_asm+0x1a/0x30
>
> [  118.348258] CPU: 7 UID: 0 PID: 3613 Comm: kunit_try_catch Tainted: G  =
  B   W        N 6.12.0-rc6-00221-g3738290bfc99 #1
> [  118.359770] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN, [N]=3DTEST
> [  118.365490] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS 1.2.0 =
12/22/2016
> [  118.373542] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  118.381677]     not ok 4 kmalloc_track_caller_oob_right

+Marco and Alexander

Looks like KFENCE hijacked the allocation and reported the OOB instead
of KASAN. There's a KASAN issue filed for this problem [1], but no
solution implemented in the kernel so far.

Perhaps, it makes sense to disable KFENCE when running the KASAN test
suite on kernel test robot for now?

Thank you!

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D212479
