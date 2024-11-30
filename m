Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739571A262D
	for <oe-lkp@lists.linux.dev>; Sat, 30 Nov 2024 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732989302; cv=none; b=GSXLb+OspfEZEf71qLt6nmrTsgOjiDrTxOvHlLgtuUywjdX8kMnZQz1C3/uiuRf7usZOaofTbX20+bybZES5RJnXPxHM+vemSPBam/Vtn9gOndd/WCLIUclK7If1i4LGdM7NQVrRixIYjXKuANi6Z8/ISleMdzDL0vofaVcjtRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732989302; c=relaxed/simple;
	bh=TBkohQCe2NGHE89Lnt7hpzegbj2T78s6vHSK58z3pLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oa6SuCnA2Pupuvac4m0z87mNSF2boSRKwLGRY0vGFxNIuyaqlwK7LYSHQIZJdeyTPnCG0rddy6UkVts6Pcv6XQEIhR3snnV5G9x+7prgpIvJj1noJTU93OJ5WW+kgnycUCaHJqtEnpvGleUe8GDQFykgBFmdTiadXcoFAjkwxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Yap7fj6v; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yap7fj6v"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9e44654ae3so353870566b.1
        for <oe-lkp@lists.linux.dev>; Sat, 30 Nov 2024 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732989298; x=1733594098; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UmhUEJ3l16+JAXSnSdZ675vJ19gWez6ArVsbJQ9w8QQ=;
        b=Yap7fj6vraztwW25vYQgMTK+aKTtwjHu4Rj8kCLDC9XljSOOqKRMu/g8QaHwqUDWdI
         td6bbY5axy4kMzn9/nUu799/OwNFaL/HJEqW2WHg0npUHfVujYG/P5yYy5N41Q6dmWTj
         Zq+mxNWt6kyuxy0jmKUO5PU2PhIoujpcNbQzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732989298; x=1733594098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmhUEJ3l16+JAXSnSdZ675vJ19gWez6ArVsbJQ9w8QQ=;
        b=FpwpduSmhn6LaHTGSODzqesKOr1x8sy48JYyC5188/Ge6mzOGdEoFBV00hEUR8ILWO
         DdFqaJirREW+TcgUtgXtLw3ilNcl3CRm1l08U9PAY5opAGTX9WtuS+gQzOtT9pC+hG2Y
         3SeXN/WlbkoppUcm0a6mZCIAZkEwc+YdyABqvaQqjjFzkmxziMRE3x5y1ViKVNjpNV8i
         a/wVN6PvlmWxDZu9TPZpr1D5/+iHHu7o90xj7iVzIljp8wemmaxhSeiogncP4AA6QACP
         mIlEUq3bORCpqxC7N89VxK3u0fdUKimXqiX21Uke1LSRfC0wt4zMgL4WiMbIBw9vwkBe
         tsmg==
X-Forwarded-Encrypted: i=1; AJvYcCWVODtS7C9qKyK4wP1pw1/32sEi9KSLwvaPrwtbjCLHCdYrycuY6gIDcT7KL7SXi8iulm3Zv8A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOuDrLBAIOOAYRkfDUtxtoVJXD2Iedkm+r3NLEh1Hg8VXJMQBK
	QjWildvNWx4dg5B+o/5vVZi8My07tHY8r7Mi5Pn273938S9ApGx+vwXUSbl0eDVNbssQkfIJX17
	lNZTnJQ==
X-Gm-Gg: ASbGnctBGqk0o3OK2d5c4m9izAXR1lY0cr0OkPa/IAibfJBwdN0kS8zU2deDjPawMg+
	1BklQB3LUxzmmAUHl7RuXmpwKSo/ODxkIIl9OWBuVrdURN793kfxNzf2UBj5+3cByNovIssrhpt
	S+WO/MKGEGd67QEOHbqoRWd+4Ll+cELSd6tO5abSMekQI1k1Q72mhYIYPxDW0A7oRnUeXztCXcq
	Kp0DxoqJ0N1/zcJwNSGHoXQViK+1JCsS2/1IkuHkwFiAnyZNozBAT+bt3QjgFuzhEgO9ewKmkmm
	5z082IO11WBHyRGw5RQY2bIq
X-Google-Smtp-Source: AGHT+IE2qTmB+3sD6pnhuUUTPmaqfZHCI6hJiPo5t8Kx4494UvY+oQPFxipFsLSRH0EIBZoPsQr8yA==
X-Received: by 2002:a17:907:6ea6:b0:aa5:4c3a:3b55 with SMTP id a640c23a62f3a-aa580f5814amr1746609366b.36.1732989297530;
        Sat, 30 Nov 2024 09:54:57 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599953f89sm299351966b.192.2024.11.30.09.54.56
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 09:54:56 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa5366d3b47so443320366b.0
        for <oe-lkp@lists.linux.dev>; Sat, 30 Nov 2024 09:54:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrERhfxtCOUcVu2NIDdBHSCXGyOOi9gnfJNbyqOcynBvmBGoMGBDYK9Z82y5dQFocp78tvnO4=@lists.linux.dev
X-Received: by 2002:a17:907:780e:b0:aa5:1d6a:540b with SMTP id
 a640c23a62f3a-aa580edf9f2mr1127107466b.1.1732989296168; Sat, 30 Nov 2024
 09:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411301528.342383d8-lkp@intel.com> <069d686ab958d973563cfad52373ec6c8aad72ca.camel@surriel.com>
In-Reply-To: <069d686ab958d973563cfad52373ec6c8aad72ca.camel@surriel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 30 Nov 2024 09:54:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj0HyNR+d+=te8x3CEApCDJFwFfb22DH5TAVyPArNK9Tg@mail.gmail.com>
Message-ID: <CAHk-=wj0HyNR+d+=te8x3CEApCDJFwFfb22DH5TAVyPArNK9Tg@mail.gmail.com>
Subject: Re: [linus:master] [x86/mm/tlb] 7e33001b8b: will-it-scale.per_thread_ops
 20.7% improvement
To: Rik van Riel <riel@surriel.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Nov 2024 at 09:31, Rik van Riel <riel@surriel.com> wrote:
>
> 1) Stop using the mm_cpumask altogether on x86

I think you would still want it as a "this is the upper bound" thing -
exactly like your lazy code effectively does now.

It's not giving some precise "these are the CPU's that have TLB
contents", but instead just a "these CPU's *might* have TLB contents".

But that's a *big* win for any single-threaded case, to not have to
walk over potentially hundreds of CPUs when that thing has only ever
actually been on one or two cores.

Because a lot of short-lived processes only ever live on a single CPU.

The benchmarks you are optimizing for - as well as the ones that regress - are

 (a) made up micobenchmark loads

 (b) ridiculously many threads

and I think you should take some of what they say with a big pinch of salt.

Those "20% difference" numbers aren't actually *real*, is what I'm saying.

> 2) Instead, at context switch time just update
>    per_cpu variables like cpu_tlbstate.loaded_mm
>    and friends

See aboive. I think you'll still want to limit the actual real
situation of "look, ma, I'm a single-threaded compiler".

> 3) At (much rarer) TLB flush time:
>    - Iterate over all CPUs

Change this to "iterate over mm_cpumask", and I think it will work a
whole lot better.

Because yes, clearly with just the *pure* lazy mm_cpumask, you won
some at scheduling time, but you lost a *lot* by just forcing
pointless stale IPIs instead.

            Linus
