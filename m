Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF985646
	for <oe-lkp@lists.linux.dev>; Tue,  5 Mar 2024 13:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709643795; cv=none; b=tZI27Sdl6cX55Y/pg3BEEP5bZQInjRrIzZgfu9gx21EsoYXBRr4L7CYqLtiB2OmmI7Yf3zlgv8C6uHOC+Blv7YxvWi0mU+4k95CLe/G+pPzK9iZ59pY7RQHYxGfWkJ1YgsFebZnaT2/zWl24nf4q1PtaNEyVXfMZwHTP6vCQCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709643795; c=relaxed/simple;
	bh=FMlR3b4A7+t893mx3XssS4mADLt37ULz5EyCiwBOe4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0YX1SBjgwXIYdTRVa+wHlggObLEIBBuXl7w7/sCFlqc3mi4rzX7PT49ojWc0pZNeH2Jx6DlEGh0q5w3wezduILX0aLVlgCzGE4/AerBNmehRpKqIBdhCUPodKiiET1ya/JroIRGGU8s5MJu1e4n24oOapzSCFM8ZsoyqMCh5gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U2IxO3lL; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U2IxO3lL"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c213690558so134295b6e.0
        for <oe-lkp@lists.linux.dev>; Tue, 05 Mar 2024 05:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709643793; x=1710248593; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y03NzawgLsuvVK3dnh3vUuU8cb8xlgzFX71BC6/j7b8=;
        b=U2IxO3lL0VM2MTV2pirmbnx66aoarvdxzyrFmunyaGht/W1EBeU6HfDnLMQjf2ymMK
         22T+CyQW/ZoCkje0xIqco0mzeN9D4smniMz3fB99zKpFVf/xpT7evkqCbTorTuIazC+8
         dUzkit1fpgv2Bs3Cc88OD/wFCkCwmDg5PzvdLbJdfjuCVD924ap0uTfVl1QUQ62C/lYy
         +ZDapJZviD0j/9QNnnIG0bLTCSuoxOAxMvpLKkj0StseHCiCWnY95bZmnj7qQZHB3ODA
         a7z12wNd0jSM/wxzLuJP2QNhObroaXOyk1FUNvhmHPBA158osI//7CqGOR0aCBsbdaUo
         p4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709643793; x=1710248593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y03NzawgLsuvVK3dnh3vUuU8cb8xlgzFX71BC6/j7b8=;
        b=bGQkzFehhkMbHI4/oto/80N85PZzXNJC0lZDFH9bVNG8jA6QK3WmwH/7hNDSMDOGaW
         LD86atpXUykzfRi3NcoLwiJvo1B+ys8L/3qM6bHEq7lYyjZfx8tNE/n0vPgP9YGN6BGO
         hv/TjZscJMLtV9cJ/tav4ykcJJaK4gFSZBVHJ2JFGm/Hu6RWnW1TOlABqYRfKowxA/X6
         TGT5rPqVQVEpzP/nq1DdW4+quv/AgUrtpnrsDVEZAvatKS+3bXKUyCdy4+HrMqzLUibn
         gg71RQJ+SnhKCH1GFpTzWX5iPYtxPtu8RAyqM6Gn3x+ecxcPWAGGzj/R1ogNYlfRxCUQ
         DQww==
X-Forwarded-Encrypted: i=1; AJvYcCUUbp0yt2QI9fdSDY1jMOl9qqpCTQY2EejpPP1tB8bf8D50w6Tjw6NdsJ1Mu86di/KQyl7amrvyFSxc6+3EJOHiCP5d5brH
X-Gm-Message-State: AOJu0YzGp0TZb5M0T/FUUBGdPc9ZHQBOK1kq6ICEJMfrz5PfgM02COWn
	/3TXQysVXJ5L3mZenJ/6YqnwOi7RnCAdxFbe3MDcYtBhjk1qzaa4dINOL3uVXovUbLc3OfHZVKp
	yvOF60xSbTOn/alMfpHxGvhbr06q0Gc8eBDbT
X-Google-Smtp-Source: AGHT+IEjB+D36pPsTT+GfJa0+YlKEbqMGVHKFQ8yEGj0UDz27soUzs9SaKjQOp1hKs2S/ESVzH4SX6uDdxrplqFQxuw=
X-Received: by 2002:a05:6808:1597:b0:3c1:ae52:6f91 with SMTP id
 t23-20020a056808159700b003c1ae526f91mr1799803oiw.58.1709643792910; Tue, 05
 Mar 2024 05:03:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403051032.e2f865a-lkp@intel.com> <ZeblmHyVlxl_6HGC@localhost.localdomain>
In-Reply-To: <ZeblmHyVlxl_6HGC@localhost.localdomain>
From: Marco Elver <elver@google.com>
Date: Tue, 5 Mar 2024 14:02:35 +0100
Message-ID: <CANpmjNMOazCrzJr+Ckx0vM73P86dPM_0qbcv=Nu44jUtPERD+A@mail.gmail.com>
Subject: Re: [linux-next:master] [mm,page_owner] 4bedfb314b: BUG:KASAN:null-ptr-deref_in_init_page_owner
To: Oscar Salvador <osalvador@suse.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Mar 2024 at 10:26, Oscar Salvador <osalvador@suse.de> wrote:
>
> On Tue, Mar 05, 2024 at 02:08:23PM +0800, kernel test robot wrote:
> >
> > [    6.582562][    T0] Node 0, zone    DMA32: page owner found early allocated 0 pages
> > [    6.612136][    T0] Node 0, zone   Normal: page owner found early allocated 73871 pages
> > [    6.612762][    T0] ==================================================================
> > [ 6.613351][ T0] BUG: KASAN: null-ptr-deref in init_page_owner (arch/x86/include/asm/atomic.h:28)
> > [    6.613893][    T0] Write of size 4 at addr 000000000000001c by task swapper/0
> > [    6.614434][    T0]
> > [    6.614600][    T0] CPU: 0 PID: 0 Comm: swapper Tainted: G                T  6.8.0-rc5-00256-g4bedfb314bdd #1 29e70169ace75ef72d53825e983f3dcb1d5756d9
> > [    6.615605][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [    6.616367][    T0] Call Trace:
> > [    6.616604][    T0]  <TASK>
> > [ 6.616816][ T0] ? dump_stack_lvl (lib/dump_stack.c:?)
> > [ 6.617161][ T0] ? print_report (mm/kasan/report.c:?)
> > [ 6.617499][ T0] ? init_page_owner (arch/x86/include/asm/atomic.h:28)
>
> So, we are crashing here:
>
>         /* Initialize dummy and failure stacks and link them to stack_list */
>         dummy_stack.stack_record = __stack_depot_get_stack_record(dummy_handle);
>         failure_stack.stack_record = __stack_depot_get_stack_record(failure_handle);
>         refcount_set(&dummy_stack.stack_record->count, 1);
>         refcount_set(&failure_stack.stack_record->count, 1);
>
> when trying to set the refcount. Allegedly, because dummy_handle is 0.
> I thought we fixed that with
>
> commit 3ee34eabac2abb6b1b6fcdebffe18870719ad000
> Author: Oscar Salvador <osalvador@suse.de>
> Date:   Thu Feb 15 22:59:01 2024 +0100
>
>     lib/stackdepot: fix first entry having a 0-handle
>
>
> But I guess this is different.
> The obvious way out is to only set the refcount and link the stacks
> if their handles are not 0.
>
> Marco, could it be that stackdepot was too overloaded, that by the time
> page_owner gets initialized, there are no more space for its stacks, and
> hence return 0-handles?.

That's possible. But it's unclear to me what exactly happens. Are you
able to reproduce the issue? (I haven't been able to because the
config enables CFI which seems to cause other issues for me,
presumably toolchain related. :-/ )
