Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5587392C27
	for <oe-lkp@lists.linux.dev>; Tue, 10 Mar 2026 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773162682; cv=pass; b=Qy0Nbr8JcI4nladgEVc6I8zCxVcmnl17ncbBnULgb9kK2PPl5yEeavSTAO5y6PfDYswGXSjnjTGTCHBXY8rHUj6l0GeF9yRul+7pT//I0dQvyIniv8nm2EUGdtlPRbYC3rbwNmnZUKuZNq47nrM+yLodrMbGsqm9Q+M3tBhkAcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773162682; c=relaxed/simple;
	bh=rIytcT7NQWmHQrRMV4kQPYiHluPbhaYS+tuG8jtTkDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5bmKjapJoCgnZq0BvDsER2OVqaz1sWaO+t5BuFrZEtmG9AE0EJrY1Hle/G3VWzNTo3K78lS35/hHkXNJl8FjfTrQBxh2ZU5RWPQyMdL/KkC8Axb9TxcAPuggNFq9kSvlVeIJJ07tx42NFVsDj4z6dReOduiWERSYmyLL4BecjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJ0TfUJo; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJ0TfUJo"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ae222d978so12953669d50.1
        for <oe-lkp@lists.linux.dev>; Tue, 10 Mar 2026 10:11:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773162681; cv=none;
        d=google.com; s=arc-20240605;
        b=MoUU6g6IB515G9/Bbw1EimGO/RUtQrNadsO/MYPxUxucJHgxv7kEd7G3/WezRKIN4K
         ppd9vawllVAZdvlw5AVzeO5eOx0OaaUb95hY6wbrPeuqwANpuw5KOajQcFKQVWz1uyxG
         6S0b2FF9bycFj8FjPcQj7QVMUIlniczjyD5mijadTnHQ7xeJsNNpoGWPrrFoPR+UWnMv
         hPg3Yrh/0ucgzbiUpsE2xL2Y/BHate4prmOE7uMK+bVCK9rFHsD54zwB0XUBbGKGIFQH
         6Wf1vrupIWzCqAKNcu5GbaKi0b7hH9g8o20Y6Nl7OsQMd9V92qBgf0TG8uEpbPCv+ZSM
         odlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zyRYdNjEVtbl7DXwVYkaYwB1DdzX1vN9HuUXVCxzvE8=;
        fh=UcFVJCqLvX+lhFt0O/FMOMnld4ghUnfiYb2u8ds1h5Q=;
        b=P0rIiqGodHhXMQs/t6dIS0SD5+z0Jv053fPSa4xvKrOpYJOVGWRmdffMfR5NfBS+sW
         qMUdIHPMJ/AStXHzevHbdRPZWPafCe5z4bgZUt7avmpnNFHP+vEHYS8RefmYPZUH1vSy
         CrPQXJvCcnyuUcUY9WDg/WvQW0XE1yDdZ4XzzA9Bpynbq4ECXTNnRMF+vmEOswZbyH2a
         4cov1HgS9f/TR62esyhCjlO7z9yYizPd2GfCThlSLchXKa35YyOemcjTlUQ7Z9C7DSML
         EfgYWnWiUErBXSzcBhppB0wleapowngOtS5ovg2TDfV3YNco+YXTyfMzkaAoLt+HOJp8
         YAyw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162681; x=1773767481; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zyRYdNjEVtbl7DXwVYkaYwB1DdzX1vN9HuUXVCxzvE8=;
        b=XJ0TfUJoj636DotwZzjnCj0J0B52G7dK2ewXdIpBPBAkegpCMZFDtboj64vJorUmzB
         BS11ou4MdEd5/KrfphRcwZ+/I5rJk8L6516gJ5xuxsPlv8vtcHml9Jq8JDglyCgMRxSO
         mbD/ZRtPhaxrWbK/g17npovtPgteVnl5Kzzu80fiiQud3Ui7FppBxlfus9d/g5aMVdRg
         PFojik6VDGdpZAITZl/+L09TfRNY6qSZhTcug9Rzcai/u8dBLSqOhig7LPLsbsv65MEr
         2wLAJl4Xv5tzsna/SGPs11XdSbYJ9Kc8eEe+u3KiJ4S/TLmj5uV/9p5+27V1CLmQOHmy
         7ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162681; x=1773767481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zyRYdNjEVtbl7DXwVYkaYwB1DdzX1vN9HuUXVCxzvE8=;
        b=tketm1r3pGQtnn2hjmOHTUs4df5T2DvrU5WOYwoS+OcNra7VNKGEUhtIwDyQMpBLQ1
         c+ltrRXXW7Dm4k8XcSChWLaWPjvIF5sGIT6/K2PlQVehnSd4Ls1YQXZq89Ry/lb8EzYz
         KpcMevE24ADtLwH27yYUfZ6WBdVfCaqHJIoslFHoGq2+BPTK36VBU7E8ZeBLxIw+k/sx
         VUEj1M+V9fYsVOAiwd6MCcOiWtSNXsByhZaFEK7xUTdMxnxIhRgCh+bH/XEghuSaI/0M
         xHKT/ZGjcd2resdQTQHYDWO4QSKDrziCtATdm6zf5BMStI90Zy9zkYabRxL/RMShfCX/
         Bbtw==
X-Forwarded-Encrypted: i=1; AJvYcCUlmC5lW2BW1XRjMddlLPT0LlUGoOKceBU8MC8MpQX9Mh0/wYXyysmCp1UFeI3iX7ZVVG7wS5o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPAUxl1zDuIJubYXI8fF8vs6/MDNK9S7wuaCFgoYKGb7nylXL/
	uYhmWRRQrAfqBCa3K7+HRRAWgcbFqv8Y+FCBhL/NLzmkNkB8XrX8rPGzhH+Qzc096aZ+3ki+tZx
	MEXoQnqqyV6bsAFLBR5PmuvA2uiGM58U=
X-Gm-Gg: ATEYQzySGRLRp3r1vX0ZwWP/1LXQlxh85UyHYz8Dm44P4beF2xQ/dYi427137qTAZ3i
	MxoFh21p4XvaJ2NOpMpZRbSqr15w9OKbNM3fNPWc+cgZZLen8hAAzGgftkCuS8v6IvFDZAmIlG2
	72awt4wu/qhwNNEG2Bz5Kz5chis8BPAWrO17+maBiLArRBjkuS/c6+ItZOoGdmTkY51W1eZRz3Y
	ImMg4JnWunk9viSnWDfAP4rQ0XbrlUj75Xo9meEHAYF37sDEWJjtP2LlbD7lADE/k6tOy7ZlfKX
	z3+XLA==
X-Received: by 2002:a05:690e:120a:b0:64d:296a:8b0e with SMTP id
 956f58d0204a3-64d296a8c3fmr9264736d50.82.1773162680699; Tue, 10 Mar 2026
 10:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603102229.74b9dee4-lkp@intel.com> <20260310152350.GF606826@noisy.programming.kicks-ass.net>
In-Reply-To: <20260310152350.GF606826@noisy.programming.kicks-ass.net>
From: Joe Talbott <joetalbott@gmail.com>
Date: Tue, 10 Mar 2026 13:11:09 -0400
X-Gm-Features: AaiRm52LUgX76nJU2fQzNG1ul3iraLitSBj9Jd5Hbesyj8pkYwso_SelqFiwoa0
Message-ID: <CAL7gdfeGFgppkRH5=pWfx7KCx78xsUPG_-aRsP3zqw+yLKJQ_A@mail.gmail.com>
Subject: Re: [tip:sched/hrtick] [hrtimer] 2889243848: stress-ng.timermix.ops_per_sec
 30.1% regression
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 11:58=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Tue, Mar 10, 2026 at 10:46:16PM +0800, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed a 30.1% regression of stress-ng.timermix.ops_=
per_sec on:
> >
> >
> > commit: 2889243848560b6b0211aba401d2fc122070ba2f ("hrtimer: Re-arrange =
hrtimer_interrupt()")
> > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/hrtick
> >
> >
> > testcase: stress-ng
> > config: x86_64-rhel-9.4
> > compiler: gcc-14
> > test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.1=
0GHz (Ice Lake) with 256G memory
> > parameters:
> >
> >       nr_threads: 100%
> >       testtime: 60s
> >       test: timermix
> >       cpufreq_governor: performance
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202603102229.74b9dee4-lkp@inte=
l.com
> >
> >
> > Details are as below:
> > -----------------------------------------------------------------------=
--------------------------->
> >
> >
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-=
lkp@intel.com
>
> As per always, I find it incredibly hard to deduce how the test is
> actually ran.
>
> I suppose this is:  stress-ng --timermix ....
> but what arguments exactly?
>

It looks like it can be found here:
https://download.01.org/0day-ci/archive/20260310/202603102229.74b9dee4-lkp@=
intel.com/repro-script

stress-ng --timeout 60 --times --verify --metrics --no-rand-seed --timermix=
 64

Joe
