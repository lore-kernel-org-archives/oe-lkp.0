Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A12C200DF
	for <oe-lkp@lists.linux.dev>; Wed, 11 Oct 2023 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRzhnFE4"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50325ce89e9so9160460e87.0
        for <oe-lkp@lists.linux.dev>; Wed, 11 Oct 2023 07:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697034570; x=1697639370; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJDQD0YO+1hmRPj2gjzPqkberRxZIp9HO672Ebr5SVs=;
        b=QRzhnFE4MS9qVLdER0bs1uFbB4fr7HIQkQc7YKmvl/UM9p+tZvctjvLm7fBYq72vp3
         DKVlPi1J0v5XO5kZQuQVFnrPgvogBfl/30lpRXG+fvUCfePzgsBPUMEQAvZ/3zAbf1Sn
         Erng0LLLKwnZ4ZRTZBWGHa2ebqbMV0QXJSQcsXCifIlsvHL2d+JvLdjWJbeVmC+fYF1E
         3cdmDXhImOJJoyJr+O3BDS9SLGwmDa/ZsGHbs6Myyv/rLYTaImEGaq1qJdCpaOEpBlcR
         AQdOX8o2GZfA6mjpjk5x1fiwiXoi5eD6k4A3T7j5tb5X7MkJf9OuxLUSqoerPR7t29Wt
         dEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697034570; x=1697639370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJDQD0YO+1hmRPj2gjzPqkberRxZIp9HO672Ebr5SVs=;
        b=XZpvTzB+Xy+NQcdLFyQz46WC7NZZv9+3BGkOs2r4CBEBHzx56sxXqWH4X2KbKp1jjO
         NkZikp3fTva+GApz0IqkNwOLsPGZEUPgQDGC5AOlyxHEy2AkZ3Z0YkeYA3o9HE3hA/hX
         jT4trcIGF3DRCS2Wo+QGHS1NSoNFji4oEu1m4I+0j6uDnvTZsY3xtaNfS/4YYJGZhIrj
         nfMKaqQXjrH/pE6p7qHxEU3U72iCIXloB0b1fj1o+bQBfhWHsQRa8qbWfEkc49QTyie3
         il256kzb8Ii5tqPhaiHzCeu5fLsVlyIkKXaCUVbOyGpJKxxwYFndoNQTmi6rU/EPrMRM
         vcIg==
X-Gm-Message-State: AOJu0YyyMge3RuERNkdzjy+o8hkpO3U/8La86q8TSTXM78cvE5CX8yZl
	UDAH5xOTn9CgSgXOc42aVG/ZzqCqAvniWb5EJI4=
X-Google-Smtp-Source: AGHT+IGvpsYxD60ppYTEpXFCxXgv/0qAuvtG9murFtrfy8bO9HjYOUJ9widfOB70iHhjBWly6NJCO3PINQAE8KVmIWs=
X-Received: by 2002:ac2:4add:0:b0:506:947f:6b75 with SMTP id
 m29-20020ac24add000000b00506947f6b75mr7882826lfp.14.1697034569905; Wed, 11
 Oct 2023 07:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310111838.46ff5b6a-oliver.sang@intel.com> <CANk7y0g-iaZfWCae=sJA34H39x7DcNBCaNF8yjXCy0RQhX5-vA@mail.gmail.com>
In-Reply-To: <CANk7y0g-iaZfWCae=sJA34H39x7DcNBCaNF8yjXCy0RQhX5-vA@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 11 Oct 2023 16:29:18 +0200
Message-ID: <CANk7y0jMMuqL12zGL-6Yvb2=4h15mHdMp3e8n-Sd+pHRj8wXxg@mail.gmail.com>
Subject: Re: [linux-next:master] [bpf/tests] daabb2b098: kernel-selftests.net.test_bpf.sh.fail
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexei Starovoitov <ast@kernel.org>, bpf@vger.kernel.org, 
	oliver.sang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yonghong,

On Wed, Oct 11, 2023 at 4:01=E2=80=AFPM Puranjay Mohan <puranjay12@gmail.co=
m> wrote:
>
> On Wed, Oct 11, 2023 at 3:20=E2=80=AFPM kernel test robot <oliver.sang@in=
tel.com> wrote:
> >
> >
> > hi, Puranjay Mohan,
> >
> > we reported same issue when this commit is a review patch as:
> > https://lore.kernel.org/all/202309261451.8934f9ad-oliver.sang@intel.com=
/
> >
> > now we noticed this commit is in linux-next/master and we still observe=
d
> > failure.
> >
> > is there any requirements to run new tests? Thanks
> >
> >
> > Hello,
> >
> > kernel test robot noticed "kernel-selftests.net.test_bpf.sh.fail" on:
> >
> > commit: daabb2b098e04753fa3d1b1feed13e5a61bef61c ("bpf/tests: add tests=
 for cpuv4 instructions")
> > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> >
> > [test failed on linux-next/master 719136e5c24768ebdf80b9daa53facebbdd37=
7c3]
> >
> > in testcase: kernel-selftests
> > version: kernel-selftests-x86_64-60acb023-1_20230329
> > with following parameters:
> >
> >         group: net
> >
> >
> >
> > compiler: gcc-12
> > test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3=
.00GHz (Cascade Lake) with 32G memory
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202310111838.46ff5b6a-oliver.s=
ang@intel.com
> >
> >
> >
> > ....
> > # timeout set to 1500
> > # selftests: net: test_bpf.sh
> > # test_bpf: [FAIL]
> > not ok 13 selftests: net: test_bpf.sh # exit=3D1
> > ....
>
> The test "ALU_MOVSX | BPF_W" is failing for x86_64. This is a new test
> added by my patch.
> This is how the test looks:

As you have worked more on cpu=3Dv4 instructions.
Is it a requirement that MOVSX32 can only have offset =3D 8/16 and never 32=
.
I know that MOVSX32 with offset=3D32 is equivalent to normal MOV32.

If this is a requirement then the below test is running an invalid
instruction and we can remove it from test_bpf.

> {
>                 "ALU_MOVSX | BPF_W",
>                 .u.insns_int =3D {
>                         BPF_LD_IMM64(R2, 0x00000000deadbeefLL),
>                         BPF_LD_IMM64(R3, 0xdeadbeefdeadbeefLL),
>                         BPF_MOVSX32_REG(R1, R3, 32),
>                         BPF_JMP_REG(BPF_JEQ, R2, R1, 2),
>                         BPF_MOV32_IMM(R0, 2),
>                         BPF_EXIT_INSN(),
>                         BPF_MOV32_IMM(R0, 1),
>                         BPF_EXIT_INSN(),
>                 },
>                 INTERNAL,
>                 { },
>                 { { 0, 0x1 } },
>  }
>
> I am creating a build for testing on my end.
>
> >
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20231011/202310111838.46ff5b6a-=
oliver.sang@intel.com
> >
> >
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
>
> Thanks,
> Puranjay
