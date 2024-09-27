Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AEE1898FC
	for <oe-lkp@lists.linux.dev>; Fri, 27 Sep 2024 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426842; cv=none; b=K/d8r+5aM5qRKTx21g2g2XIDpV31wBtib4D1VXI81vpw/O81mfMT0bkAimBCdhwtRN1FEQTBPQETO2aXxOLzL7hP8rCCC1ctdKQFMCUDtdzmaRwx6B/w93/t0SUrkdqHh0QEa5jtPZmBD06Sucr3t+2HEnf4GA3vWNiKij/Y2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426842; c=relaxed/simple;
	bh=e9UCiXM+mzDpcuo9tldMzc6UvOdXhJq/MA+nkkOH5lg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7GPU1UDpqGNM2jPVViKnU2ClMoE/usNpyog7I2ENovb4ZC15wu+M3b8/+JaZSDPxIk+khu4uSOw9FRSMSxy4V3/7n6lJKTxGNh/gopQ4Hk9eS3uieUWDRzSfKkbl3ktW1VeGKiV75IjQQDlrjkQBFj9pUUADqqeh7fFpK3LK3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeBDtFId; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeBDtFId"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6cb35f2aec1so10359076d6.2
        for <oe-lkp@lists.linux.dev>; Fri, 27 Sep 2024 01:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727426840; x=1728031640; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4D9ePqtkdnv0YKqqTp5G+TqxP1szwFKD9xiEvZ3Jnw=;
        b=TeBDtFIdkrpnDQzw6YtCOdvT1TD02KJ/8I2nqxYYXUA6B3G2Ok2y3HiA9WPg1SWpo2
         yA7pBEpgDTEaMi8jaSsJ1k6ROQlXn0RlJGX/a6zWuLJ4q5hD+mA+sae2tP9oit13bAAS
         7pXKzRmWBk7faeDWYTigHeVi3x2FNgOHS2cZYAT20BTKAFBL8m+JW6XqhEzjJYt6WXjb
         A3EUGxB+UrXSmTr/hJAXh5yT5Jj3/5U1cQ2YzswAaQuUSCPy7QaXhyxkeiWQ1tkd5prf
         TqN3FNtq42D2KN/B6YdoK09yGH6nLB+cSsDqB2gMy5l52uz1FGOvm+2QDpb7pfzUpwg2
         Ox/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727426840; x=1728031640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4D9ePqtkdnv0YKqqTp5G+TqxP1szwFKD9xiEvZ3Jnw=;
        b=md3q+WjmM671ZFWNm/rX6JmeK1ET9l035RSWCqDA+ViRUQks2/8/yvrqMNtiBoCDuS
         qRdETCN6h7XMfg1gwPwQ9HwLqhRGbgrX3nZ7n+ds2PIgUQUQG2xoI1nOBBOGEjLW58Qz
         j5T+9aScDWYbvefkrl8X14DkhuN8yrWQkmLF+eITbMA569zzUubhdnQrvYRnJNAtzVv5
         hH5kPZYKV2xvxiHvk+nCvYwhta0/Gj72Hh+9BwLyfAcEQ/EID6Gd8iPuBIr85bKLBYz0
         UNvRiWkwjkN/Z/YYi7WIMarX4Jj4fm5oH4r3DSrl8MecLhjpiuH4QwgknN4dVc6unq8i
         j4AA==
X-Gm-Message-State: AOJu0Yw83+YTLI2Z3qBcB/ToRcTegUYAmMokJvAiNWmkARWyzUSjo4ek
	7aWWIT3XHWvtDl+DDiAciegAlJS+bHjEjzRlSw8xrzdVZ020S+YtYSZ322fUE0P6o72VDDawqH3
	v1nqOUKG59+B/AZ9R0O//bmWiSSU=
X-Google-Smtp-Source: AGHT+IEDhzDvStqBzCh9UD4kHE5QtQr2IKhYirEM9k8FeVztqKEDVNTmVu+atHXWvFhfEuTC13zwyQTw+bcIXeRfe/4=
X-Received: by 2002:a05:6214:570c:b0:6c7:c650:969b with SMTP id
 6a1803df08f44-6cb3b63daecmr38217606d6.27.1727426839558; Fri, 27 Sep 2024
 01:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240923090028.16368-2-laoar.shao@gmail.com> <202409261230.c7f0e4eb-lkp@intel.com>
In-Reply-To: <202409261230.c7f0e4eb-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 27 Sep 2024 16:46:43 +0800
Message-ID: <CALOAHbCcMxzMUNaPuoDkErcke6YuuxyhN-JpYQjKK1566aNMcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] sched: Fix cgroup irq accounting for CONFIG_IRQ_TIME_ACCOUNTING
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	aubrey.li@linux.intel.com, yu.c.chen@intel.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:14=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "WARNING:at_kernel/sched/sched.h:#cpuacct_charg=
e" on:
>
> commit: e5633f7cf7d093cf5bb191663054441fbc745a5a ("[PATCH 1/3] sched: Fix=
 cgroup irq accounting for CONFIG_IRQ_TIME_ACCOUNTING")
> url: https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/sched-Fix=
-cgroup-irq-accounting-for-CONFIG_IRQ_TIME_ACCOUNTING/20240923-170321
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git bc9057da1a=
220ff2cb6c8885fd5352558aceba2c
> patch link: https://lore.kernel.org/all/20240923090028.16368-2-laoar.shao=
@gmail.com/
> patch subject: [PATCH 1/3] sched: Fix cgroup irq accounting for CONFIG_IR=
Q_TIME_ACCOUNTING
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
> +-------------------------------------------------+------------+---------=
---+
> |                                                 | bc9057da1a | e5633f7c=
f7 |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 12         | 0       =
   |
> | boot_failures                                   | 0          | 12      =
   |
> | RIP:cpuacct_charge                              | 0          | 12      =
   |
> | WARNING:at_kernel/sched/sched.h:#cpuacct_charge | 0          | 12      =
   |
> | RIP:console_flush_all                           | 0          | 12      =
   |
> | RIP:ftrace_likely_update                        | 0          | 12      =
   |
> | RIP:desc_read                                   | 0          | 12      =
   |
> | RIP:handle_softirqs                             | 0          | 12      =
   |
> | RIP:kasan_check_range                           | 0          | 12      =
   |
> | RIP:_prb_read_valid                             | 0          | 12      =
   |
> +-------------------------------------------------+------------+---------=
---+
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202409261230.c7f0e4eb-lkp@intel.=
com

Thanks for the report.
The rq_lock should be held. I missed it.

--=20
Regards
Yafang
