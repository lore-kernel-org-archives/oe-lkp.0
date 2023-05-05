Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB3156DA
	for <oe-lkp@lists.linux.dev>; Fri,  5 May 2023 13:18:38 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9659e9bbff5so307520066b.1
        for <oe-lkp@lists.linux.dev>; Fri, 05 May 2023 06:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683292716; x=1685884716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7ntH9I8WgrHLiFLTG3lN+SmMHbzpUUaI+PLUqm5FtE=;
        b=Tamw83WQlYqJuFUb2vBh+DNcSocINPWHYrnf7tDbBrlrubz6hcaqkXQv/8XasUdDcv
         VoUX+xY8IsmP9+WBv51WGY2lxgBS4I5e3oHl5nyJBUWjdPQUqgtti/L4LjvCmEjULUVS
         aPwd2Dr139m0qiHqQ/xeLWQ34sYx8d5pMJOBiJXK/IXw3lDe1DPyX7qnCCzfay1wulUZ
         iQ2MRcvPUIpjO8I5q+qZGomD4wHObDUrqwRo244bfpYFSovTmVEMCstQE6fne35MILXh
         4jbwDAnV3pHQ6eIzgGHC6yngJX9lX0bHnpbfQuGVeXDZp+feiWoaMqjYqvM5SLBcvqK3
         X1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683292716; x=1685884716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7ntH9I8WgrHLiFLTG3lN+SmMHbzpUUaI+PLUqm5FtE=;
        b=kQc1h8qgTdGwpQio1aoPy2d92vQYu9f2LX3kEp7inRPgUgpNiG/sFUG3BbH7nmtlmz
         Ug2On6sOHqwLEd/M8UQXqVijdfBG5yW6wV6MiFM+EZHCUaVIiKqn28/3TBcG0AGwgL5A
         PS8C3R/6Md/am0Uc3HyvPw5jd/883f6zSpo7k2yL6ILVii2IDs38A+ZNEVJMoJUU6XNu
         uTSChrFBiDlDOnqlJYBBPCuuNO9IFZOk9CjhMl+iglXEpNKlfLNGCMUsUYHlnmreYGR6
         OqzfhRncAEbvmP/OPfkIhZ7NefA5VklGA64hnFMFEKk0Tno1p3yoklUQRleWdFukA3y1
         kHmg==
X-Gm-Message-State: AC+VfDxHmDiHbnDYbp2zzNQ6yxL32dEb6xokKyGzogEyYx1/Id6HwmYU
	Rt31YsJmZeXJRoHj9gR1uMGrGCREENEAOSdxizQ=
X-Google-Smtp-Source: ACHHUZ6Ih762uhihmbwcAI7cLEai9xqMtAUFRIU+o53mq8JFj3EB+u6hi0Ue8LNxp3uMo0vxLDmh6n+tsITFp1OzBKU=
X-Received: by 2002:a17:906:9754:b0:960:dad:5931 with SMTP id
 o20-20020a170906975400b009600dad5931mr1505690ejy.13.1683292716547; Fri, 05
 May 2023 06:18:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305051243.f5027ab3-oliver.sang@intel.com>
In-Reply-To: <202305051243.f5027ab3-oliver.sang@intel.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 5 May 2023 15:18:24 +0200
Message-ID: <CAOi1vP-GNqC-4+5e6dJWJC+yzpBh0skFkHQGYOZp0smXYwyEUw@mail.gmail.com>
Subject: Re: [ceph-client:wip-stable-writes] [mm] 55da5c1be4: BUG:kernel_NULL_pointer_dereference,address
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, ceph-devel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 5, 2023 at 7:19=E2=80=AFAM kernel test robot <oliver.sang@intel=
.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,address" o=
n:
>
> commit: 55da5c1be4b284c641193220f1c5c928aac9e4df ("mm: always respect QUE=
UE_FLAG_STABLE_WRITES flag on the block device")
> https://github.com/ceph/ceph-client.git wip-stable-writes
>
> in testcase: boot
>
> compiler: clang-14
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> +---------------------------------------------+------------+------------+
> |                                             | ec7ed44b26 | 55da5c1be4 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 20         | 0          |
> | boot_failures                               | 0          | 18         |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 18         |
> | Oops:#[##]                                  | 0          | 18         |
> | RIP:folio_wait_stable                       | 0          | 18         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 18         |
> +---------------------------------------------+------------+------------+
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202305051243.f5027ab3-oliver.sang@=
intel.com
>
>
> [    8.445981][    T5] BUG: kernel NULL pointer dereference, address: 000=
0000000000500
> [    8.447048][    T5] #PF: supervisor read access in kernel mode
> [    8.447834][    T5] #PF: error_code(0x0000) - not-present page
> [    8.448588][    T5] PGD 0 P4D 0
> [    8.448588][    T5] Oops: 0000 [#1]
> [    8.448588][    T5] CPU: 0 PID: 5 Comm: kworker/u2:0 Not tainted 6.3.0=
-00002-g55da5c1be4b2 #32
> [    8.448588][    T5] Workqueue: events_unbound async_run_entry_fn
> [ 8.448588][ T5] RIP: 0010:folio_wait_stable (kbuild/src/rand-3/include/l=
inux/blkdev.h:881 kbuild/src/rand-3/include/linux/blkdev.h:1265 kbuild/src/=
rand-3/mm/page-writeback.c:3179)
> [ 8.448588][ T5] Code: 84 00 00 00 00 00 90 55 48 89 e5 41 57 41 56 53 49=
 89 ff e8 ef 48 ee ff 49 8b 47 18 48 8b 00 48 8b 40 28 48 8b 88 30 01 00 00=
 <48> 8b 89 00 05 00 00 48 f7 81 a8 00 00 00 00 80 00 00 75 10 f6 40
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:   84 00                   test   %al,(%rax)
>    2:   00 00                   add    %al,(%rax)
>    4:   00 00                   add    %al,(%rax)
>    6:   90                      nop
>    7:   55                      push   %rbp
>    8:   48 89 e5                mov    %rsp,%rbp
>    b:   41 57                   push   %r15
>    d:   41 56                   push   %r14
>    f:   53                      push   %rbx
>   10:   49 89 ff                mov    %rdi,%r15
>   13:   e8 ef 48 ee ff          callq  0xffffffffffee4907
>   18:   49 8b 47 18             mov    0x18(%r15),%rax
>   1c:   48 8b 00                mov    (%rax),%rax
>   1f:   48 8b 40 28             mov    0x28(%rax),%rax
>   23:   48 8b 88 30 01 00 00    mov    0x130(%rax),%rcx
>   2a:*  48 8b 89 00 05 00 00    mov    0x500(%rcx),%rcx         <-- trapp=
ing instruction

Looks like a NULL s_bdev on top of a !CONFIG_BLOCK build.   This patch
would be reworked to avoid referencing s_bdev (or even anything request
queue related) in folio_wait_stable().

Thanks,

                Ilya
