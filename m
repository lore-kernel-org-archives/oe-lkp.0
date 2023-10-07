Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332CD16407
	for <oe-lkp@lists.linux.dev>; Sat,  7 Oct 2023 09:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8p8LDwo"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso5363115a12.3
        for <oe-lkp@lists.linux.dev>; Sat, 07 Oct 2023 02:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696671393; x=1697276193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+mN4Fuw8Pq7u34N8Cg808+vgUyA4DE9f1nGy42Vw9Y=;
        b=W8p8LDwohjSNsOaPEV4lvWkUD1+0ZvnjwH+Crmd33sKAlOpgxKl0FDCuZxRxQj/agn
         v+aAjKWXxLGacjbIIf8ym6oTbveKVUtk+HVtKzbAmnY8PlcLqTTewOVUHIc37+CCf3Uh
         fENntf98hjzo+3LOv6/rhCwK9pj5Bc9lu8AFhsC7gEQiRmvjK9tIQ1v3YTn1HSxl8yZI
         dqttpr5UXReegcLes9kxSwkktDnZOuwg0tdmZIOX+dQ89ES0U0t0MtfiEPRoTBD/IQo2
         /NYrks4v83f5gggN8Xqqyb2+yjhq5lgyTAvAXiYrrW6TotmCU921Tpod6leWRAAEnhhz
         LllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696671393; x=1697276193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+mN4Fuw8Pq7u34N8Cg808+vgUyA4DE9f1nGy42Vw9Y=;
        b=OJ4Hhk1pDD0Da9Nl7dFqgLxmV0EsYT9qTvx/8I/9lJpgFMdRHof30hjG/zkbLyEtAH
         Kuf6ijicvufOETtW0KGQWDErE8EG4eLdoirv7yKjXUZO7mclzYKf9MAZQPN61nPf2Wfd
         T1BEL4XPpZZ9uGshu7gKRrd5c/Uu7+zbqPqbWJbiQoca/ArzHcyxjBVlE10e4TBBVJ+q
         Y/YQR65kMM5S3dA7EP+GlzobkaIxE+6IIAHEZeWADW1N1S5PwRYKkbb9Qs81Dhe6BTCO
         GVcNBRjSkOSLK97beNU+mv9G/kXMdOztpt0qAtUBgsQfsn897+RzpOhZXlghEcm65J0d
         UDsQ==
X-Gm-Message-State: AOJu0YyeYUKHNzr4uNOpYGL4DrmNzjM3JQYLpysJxus31oMQPCUIDv1f
	SCktNWJv87wIx9o9wpFr5zSnZ/w5aLzVAZZMHmQ=
X-Google-Smtp-Source: AGHT+IEpyokVkR63nWM234tU0kyZnsFdXLBndERDqI3UKHwbaFiG3l8N6X/vxZ8zHrkQ4KDOVmBKf5O3yvpCM7MRsvA=
X-Received: by 2002:a05:6402:12cd:b0:530:f296:d446 with SMTP id
 k13-20020a05640212cd00b00530f296d446mr9529070edx.34.1696671393112; Sat, 07
 Oct 2023 02:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310071301.a5113890-oliver.sang@intel.com>
In-Reply-To: <202310071301.a5113890-oliver.sang@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sat, 7 Oct 2023 11:36:26 +0200
Message-ID: <CAFULd4bUu=wVhH8AweOPycEw2QsbFWSjP8ytr7SM6Z5WLOdWsA@mail.gmail.com>
Subject: Re: [tip:x86/percpu] [x86/percpu] ca42563486: BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entry_offset:#)
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>, Nadav Amit <namit@vmware.com>, 
	Andy Lutomirski <luto@kernel.org>, Brian Gerst <brgerst@gmail.com>, 
	Denys Vlasenko <dvlasenk@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@redhat.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 7, 2023 at 8:16=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:kernel_failed_in_early-boot_stage,last_pri=
ntk:Booting_the_kernel(entry_offset:#)" on:
>
> commit: ca4256348660cb2162668ec3d13d1f921d05374a ("x86/percpu: Use C for =
percpu read/write accessors")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git x86/percpu
>
> [test failed on linux-next/master 0f0fe5040de5e5fd9b040672e37725b046e312f=
0]
>
> in testcase: boot
>
> compiler: gcc-12
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +------------------------------------------------------------------------=
--------------+------------+------------+
> |                                                                        =
              | 9a462b9eaf | ca42563486 |
> +------------------------------------------------------------------------=
--------------+------------+------------+
> | boot_successes                                                         =
              | 13         | 0          |
> | boot_failures                                                          =
              | 0          | 13         |
> | BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(en=
try_offset:#) | 0          | 13         |
> +------------------------------------------------------------------------=
--------------+------------+------------+

Since this is a randconfig (x86_64-randconfig-006-20231006), does it
mean that all other configs worked OK:

i386                             allmodconfig   gcc
i386                              allnoconfig   gcc
i386                             allyesconfig   gcc
i386         buildonly-randconfig-001-20231005   gcc
i386         buildonly-randconfig-002-20231005   gcc
i386         buildonly-randconfig-003-20231005   gcc
i386         buildonly-randconfig-004-20231005   gcc
i386         buildonly-randconfig-005-20231005   gcc
i386         buildonly-randconfig-006-20231005   gcc
i386                              debian-10.3   gcc
i386                                defconfig   gcc
i386                  randconfig-001-20231005   gcc
i386                  randconfig-002-20231005   gcc
i386                  randconfig-003-20231005   gcc
i386                  randconfig-004-20231005   gcc
i386                  randconfig-005-20231005   gcc
i386                  randconfig-006-20231005   gcc

and

x86_64                            allnoconfig   gcc
x86_64                           allyesconfig   gcc
x86_64                              defconfig   gcc
x86_64                randconfig-001-20231005   gcc
x86_64                randconfig-002-20231005   gcc
x86_64                randconfig-003-20231005   gcc
x86_64                randconfig-004-20231005   gcc
x86_64                randconfig-005-20231005   gcc
x86_64                randconfig-006-20231005   gcc
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc

are of interest to me. Assuming they are built with gcc-12, I wouldn't
immediately blame the compiler for the failure. Due to the nature of
the change, perhaps a weakness in the kernel has been found with some
obscure config setting. As said, my default Fedora 39 kernel (6.5.5),
built with gcc-13 works without any problems.

Also, does a successful report from yesterday [1] mean everything was OK?

[1] https://lore.kernel.org/lkml/202310060322.yeZgaj6Q-lkp@intel.com/

Uros.
