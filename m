Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234D2EAE6
	for <oe-lkp@lists.linux.dev>; Fri,  3 Jan 2025 05:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883464; cv=none; b=obYFxdhmi4lqeGDWYyThS+graG5Ky2RKBBG2XDgnb+moSmGcIW5bNuRkIuD2IBJelVKKdk37N3oHh81wTIPrf2592E9EbPGzkPrvc1matx0GWJfI39OEsQq7vO2sw38ngdbyIeN92/tCwKumSB+SFz3AsRlhktFca4FmUiHxYhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883464; c=relaxed/simple;
	bh=Mm+lec5RXWIPDEy57yr7yxjKCVX4xTD62HPDeHBwcxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Of14pTqDaSls89L3P/hENSzGO2F6ECZPeGq06WQGFd+Eka/fN2rcQMUjF3vprr4bx9QSACAYsot3VxTC0Izivyb+LbQIUhfFsjah7KBKHwg/e1+T4W8RF237dxDrmIhhN8gBrpHUy8Ohqt0t4KVmbW1AQQdlxziQI5ZY0HNdb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0t01yy6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0t01yy6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso16789443a91.0
        for <oe-lkp@lists.linux.dev>; Thu, 02 Jan 2025 21:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735883463; x=1736488263; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tnn6xbqJYAHuvqQnBfT5SECUCL45Ad/ih+424BscjdI=;
        b=Q0t01yy6TcrNEThVp+7GP/xEH4QYWKBOJVDnVCO3AAONBosw16KcXYazCc6DLt9rce
         wwzWoYyEviJMct+TwseBnE619QF+1i4dpdod6qSBRk1lJ7yAw5QAiT08uEJsMbD6pGG3
         I4fGmqOio0469ECkuLk0kjoqUPvhJrHhAyZaHbwnsor0gs8LK2Ds85ra7ls2r+bG0QkQ
         jD9yyoIY2LU/TfWkXYDAqoU+kofQEDTIC2c8ekg1AToPkcVISvXOtV3bIbSHiXeIX58U
         0Ox6/6Ro7rY9ig8v5UaWQw9hct1+7KD4784nx0h63U1IpNCugDJjyGvKpwtbNDll65VX
         xVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883463; x=1736488263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tnn6xbqJYAHuvqQnBfT5SECUCL45Ad/ih+424BscjdI=;
        b=ZqDUIB4hshbf+ix/6UbQovSGA5H36+Cd7zz2oV0lq/vnDDpXXmTseodRTn997G0EY5
         g+81aVmP99DaPJZkDasrEJOy5+yl5lj0Beu9yx295NQNg/xxJUeMcff9gTmOaTQBWuF5
         Kr+PEoaXpITN/vuhoqtipHJrHBN/ooUCvVs0e6sW4cF+sNvH7a90/ky+I5BK9DIQbZKB
         XI/LsERUyBw+WwCq1UgcMr/F1IQrrlLVMPLV7lhMWWKwomX7XwjDTahBP0/UawC5Z1J9
         OSGpVga4XCebb7wKbS1CC4i9+/gKr53cZnAvAlSp749U0gzGZpDF7IH4DnWNdcjjL3Is
         bjcw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGjJSg8djbVmOc9xTXmEHaK/H6BVdHWnGVUMdM23vF+0yYW2BmqyIZF0IW4FM1BqrvLVswcs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK8hLQM0DjKsjfe0doGoBabKRL7XDlBzMmxsLFnANyEEaHuS1b
	qz3rk/k/2b6LbC5T6gnGhoFVQwh1Dund+ANjDIeCFxbOLBevs2AHShFZdVfOPmQe0qNHz16HRQZ
	lqwrS2Qj3ENeEDc6k5n0kYMrByb+CL84QmWU=
X-Gm-Gg: ASbGnct+OnepkVzqstQXqU8hPE0PuJQEHZbGdYfvehZiy7aVP21DfDyS2yYNBJbGwzu
	1kNPjlS6sn/96myi4bWKUz7VvYqtFCt/2JuydGLY=
X-Google-Smtp-Source: AGHT+IEmQnz0qg8jxBmk6+ns2wi4oSu6mST+8uO3XtZB0sreopxrxwo86w8tIgIgf95oYxq2aUIuJBGDuOyvKyxozHo=
X-Received: by 2002:a17:90b:2cc5:b0:2ee:aed6:9ec2 with SMTP id
 98e67ed59e1d1-2f452e16379mr71807444a91.14.1735883462558; Thu, 02 Jan 2025
 21:51:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412311203.ca7bddba-lkp@intel.com> <CALm+0cWOxUm_hrNe4UP4Z-vyr4RCOw+dc=kCBTgsyjHFHiHDsg@mail.gmail.com>
 <949f6251-d411-45ef-9f85-d5d069b90b0e@paulmck-laptop> <Z3Ym/DDtGOPamGjZ@xsang-OptiPlex-9020>
 <c8c4c6d6-ad52-4cd2-ba1f-c442da4432af@paulmck-laptop>
In-Reply-To: <c8c4c6d6-ad52-4cd2-ba1f-c442da4432af@paulmck-laptop>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Fri, 3 Jan 2025 13:50:50 +0800
Message-ID: <CALm+0cVbaJuMWMkU4g_6inCKiBVaVD3iixvBrfMJTqZ-3OUCvg@mail.gmail.com>
Subject: Re: [paulmckrcu:dev.2024.12.24a] [srcu] 9216c28c6a: BUG:unable_to_handle_page_fault_for_address
To: paulmck@kernel.org
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Thu, Jan 02, 2025 at 01:41:16PM +0800, Oliver Sang wrote:
> > hi, Zqiang, hi, Paul,
> >
> > On Tue, Dec 31, 2024 at 08:19:44AM -0800, Paul E. McKenney wrote:
> > > On Tue, Dec 31, 2024 at 03:16:25PM +0800, Z qiang wrote:
> >
> > [...]
> >
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202412311203.ca7bddba-lkp@intel.com
> > > > >
> > > >
> > > > Please try the following modifications:
> >
> > yes, the following modifications fix the issues we found for 9216c28c6a. thanks!
> >
> > Tested-by: kernel test robot <oliver.sang@intel.com>
>
> Thank you, and I will apply this during my next rebase.
>
> Zqiang, unless you tell me otherwise, I will add your Co-developed-by
> and Signed-off-by.
>
> Either way, Happy Square New Year!

Thank you,  Happy New Year!  :)

Thanks
Zqiang

>
>                                                         Thanx, Paul
>
> > > > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > > > index e85db7d5b364..7c7304dee645 100644
> > > > --- a/kernel/rcu/srcutree.c
> > > > +++ b/kernel/rcu/srcutree.c
> > > > @@ -1999,6 +1999,7 @@ static int srcu_module_coming(struct module *mod)
> > > >         for (i = 0; i < mod->num_srcu_structs; i++) {
> > > >                 ssp = *(sspp++);
> > > >                 ssp->sda = alloc_percpu(struct srcu_data);
> > > > +               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
> > >
> > > This does look quite promising, so thank you for digging into this!!!
> > >
> > > Looking forward to seeing if it fixes the problem.  ;-)
> > >
> > >                                                     Thanx, Paul
> > >
> > > >                 if (WARN_ON_ONCE(!ssp->sda))
> > > >                         return -ENOMEM;
> > > >         }
> > > >
> > > >
> > > >
> > > > Thanks
> > > > Zqiang
