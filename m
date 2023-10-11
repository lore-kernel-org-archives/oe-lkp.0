Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4F2200A7
	for <oe-lkp@lists.linux.dev>; Wed, 11 Oct 2023 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mO86cljc"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5045cb9c091so9224932e87.3
        for <oe-lkp@lists.linux.dev>; Wed, 11 Oct 2023 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697032899; x=1697637699; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUeu40L6qhxw4BZOnJMqKxdfg3MCHEWCwPe9Aia4Kas=;
        b=mO86cljcsc9pOp78D+on/8gK54Cs6clQJFoNS63uUy25pYIv7xczIqRiWsiR1+nWey
         2QbsrpjUtaFtxL5XzgtNzNg3vGfkY2XH4AQKnw7GggAtObX2F3ndZA5+0d0XlOSk8+96
         F/YAWOiUdCYFXCFtxNff8/oXEsJUsaRbhoRtq5xpcDcfw22z+J5VIqlLpqsuqQyN6WSd
         vwCIbsEoqyB2+Im/1LNudufRhfJ+XXGUeJBjZtBqrlagO8Ie98z5sfyfr0amHTw+cAK1
         GykTKkI9jRrlv2Dr/JRu6xk+Lqih/DfO4yGDfnjoCkW9gwdrLSCc6N8Z3f5r1HSK6NU0
         ay4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032899; x=1697637699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUeu40L6qhxw4BZOnJMqKxdfg3MCHEWCwPe9Aia4Kas=;
        b=pcbThqwI8+fO6FDeXOsXdUO+tj9axHNj+UHc4T5PGV+cl28EolYRSGkwhTOBHUbejt
         vLlhoKqofeEKnv9F5xJXLCfzlgzxX/lEn5NJGWTOMRssRZd+vNOFhK46rUdtehstOOJp
         KknWcsX2H4utj31Iwdxqfwf5Lub8bfHeqpTaIeW2nSYZ+Mk/QFlgXRdZq4zyVO8AqhYO
         OPLAqVSPk2Yop1uMTf7Z2nMlcWpuKi8IYJifIrRrwY1q0/NcEBmwYC3v0HGiaPJSvmrL
         TmT17izruSYXE0ouprNWOf1CwF9B39QMfRvnznrY5YF8DTMxubseZ2HupYZKoSuh42Sd
         fCDw==
X-Gm-Message-State: AOJu0YxkwHb1rAWZ9LyihMU+aAVW9bfADFThqZWCmz1S95RF0XB4JthE
	i8dOQpEAUlRRbDqJyscAuYK6RCiwjBj4DfZtCHA=
X-Google-Smtp-Source: AGHT+IGLzdcrqfvz7o6dqVO3bhXeslEeZj1mtDTkc1HGkGDaeDhN3YIiIt8k7Jbr5rSMili2ixx5NmJlsfr5XEBm50g=
X-Received: by 2002:a19:4f0f:0:b0:503:389d:1cc1 with SMTP id
 d15-20020a194f0f000000b00503389d1cc1mr17004683lfb.22.1697032898714; Wed, 11
 Oct 2023 07:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310111838.46ff5b6a-oliver.sang@intel.com>
In-Reply-To: <202310111838.46ff5b6a-oliver.sang@intel.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 11 Oct 2023 16:01:27 +0200
Message-ID: <CANk7y0g-iaZfWCae=sJA34H39x7DcNBCaNF8yjXCy0RQhX5-vA@mail.gmail.com>
Subject: Re: [linux-next:master] [bpf/tests] daabb2b098: kernel-selftests.net.test_bpf.sh.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 3:20=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
> hi, Puranjay Mohan,
>
> we reported same issue when this commit is a review patch as:
> https://lore.kernel.org/all/202309261451.8934f9ad-oliver.sang@intel.com/
>
> now we noticed this commit is in linux-next/master and we still observed
> failure.
>
> is there any requirements to run new tests? Thanks
>
>
> Hello,
>
> kernel test robot noticed "kernel-selftests.net.test_bpf.sh.fail" on:
>
> commit: daabb2b098e04753fa3d1b1feed13e5a61bef61c ("bpf/tests: add tests f=
or cpuv4 instructions")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 719136e5c24768ebdf80b9daa53facebbdd377c=
3]
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-60acb023-1_20230329
> with following parameters:
>
>         group: net
>
>
>
> compiler: gcc-12
> test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.0=
0GHz (Cascade Lake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202310111838.46ff5b6a-oliver.san=
g@intel.com
>
>
>
> ....
> # timeout set to 1500
> # selftests: net: test_bpf.sh
> # test_bpf: [FAIL]
> not ok 13 selftests: net: test_bpf.sh # exit=3D1
> ....

The test "ALU_MOVSX | BPF_W" is failing for x86_64. This is a new test
added by my patch.
This is how the test looks:
{
                "ALU_MOVSX | BPF_W",
                .u.insns_int =3D {
                        BPF_LD_IMM64(R2, 0x00000000deadbeefLL),
                        BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
                        BPF_MOVSX32_REG(R1, R3, 32),
                        BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
                        BPF_MOV32_IMM(R0, 2),
                        BPF_EXIT_INSN(),
                        BPF_MOV32_IMM(R0, 1),
                        BPF_EXIT_INSN(),
                },
                INTERNAL,
                { },
                { { 0, 0x1 } },
 }

I am creating a build for testing on my end.

>
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20231011/202310111838.46ff5b6a-ol=
iver.sang@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Thanks,
Puranjay
