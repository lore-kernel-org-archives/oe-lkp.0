Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B49B18CC15
	for <oe-lkp@lists.linux.dev>; Tue,  7 Jan 2025 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736243399; cv=none; b=iZW7PPLmgkoWqUG5yDLOIiGbgxYyeobjNmyO8aO7hEcYWiiC+SZnz7SBSk28nZdULtO+GglZbtsVzDsldbtA/7IUH+QI1KeEFl4b3REbYj+vUhHCw4d0Kp+vH6qdEisQy442gC2TfZL+JyWtnXZP0iJbiQE5qlpzNe6jM41CPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736243399; c=relaxed/simple;
	bh=/P5MAf/Q16xLxWpLBxiuUitMX8lqq7bYFQDKeAbW0Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeyYif4W6kEDm+lsHpMmf9HrXj1mUkNoRDXeuSg3P25DRjVOkco66y7b5WGbowNDZ3i9sjWMINy3vfkYqdcmiBPDT5Qc/CK0f/TygxrgTAqcjF/GCtN6f5a9v9Fz62s3n61EaDJe7y/jm7zWjGx52dYXIo1mJ518wTojS/0JJpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePxqq4Bi; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePxqq4Bi"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2165448243fso24376435ad.1
        for <oe-lkp@lists.linux.dev>; Tue, 07 Jan 2025 01:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736243395; x=1736848195; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ikRfWEA7ucNTYUoom2gsK05Rdbwx58/vRt4HSDogJ6s=;
        b=ePxqq4Binq5JBIJVtMK/WaWu0L7QaT6nF7Sip5HB9TIyWEpjiChdH4Q8WCVEx/A8fe
         bljFQ9Sh0qhNEo/UOktRZE19O1jyHf09ut7Z6xmiTj2JN56CUROcFyVsO6O0RR5rvx/2
         GIRpks9wIru8d3IaBip+Dj3C7ORJJ3a9upFAzTCmH6xYl/XQHTxHR36wdXyI6Q2E8AaI
         F0iqFPzRehkAEWvYKVCFMc5U0d+h67vnlEymYUu9NqosUm49OjNtZNuYC/USR8aTYRgA
         hhPZH7NqCbzY8yuKxUXk7QTgdlY5CuJ2Pb6VN1Y0g28YpQC6O6HQdCxOwXaUnXv7zxRX
         Luvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736243395; x=1736848195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikRfWEA7ucNTYUoom2gsK05Rdbwx58/vRt4HSDogJ6s=;
        b=j+/GDgNAanseLpNK9kPbgw/yWrDlWD0pUBhxoFhJniS86UQ67vM+xfhnO8ItT9uLXr
         luAKn0tQb2y2WqVSP2d/Sua9Qy8LLw0oX2J5oc4XBU+MqkDSHUzuVedAscbPC1HVVtSL
         RFK9xv4sRE0xN7fHXyGVLooodJZBiOFN3zIoEwx0kRDzLTCGJQ3GqtvwJuLkJEy0EbRO
         ciKpwR5yldpvaK64sOzo3OxDcgNvsdc/Tojq4WE7WLb1mE/Z4ATYWS1kCk+rD7ZssQTn
         LayEWnvEmgDiK7LRIICql6gyCheoncd2T0IPuR8TGt2lb9daQQS95sGyz2AktG4g/mvL
         SKEw==
X-Forwarded-Encrypted: i=1; AJvYcCUSLaVr3NdEkwDT3rZX3c/t4MDuowM7DR3ru/w/roKCG3fY0z1hBAiGwbx59U3Y6V/OwBbF50E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6DbInSDWdTm+GCCVd+I1gGu8ALkQFEhkhxk6kF1pgbozF1cao
	jXyii9rtq7YIHhbx/1RJAQ/0I3eoIZr83OXRMst84FItercOIFBs/GqRKz+weBAxcthQkk1rTmr
	qxGwNK2H+oY3CFBDnU3qkqcPRKFw=
X-Gm-Gg: ASbGncs+PMtOFj/M5A0nJSLnEq+T9H63cJUe4bxIXGN/U4XFTXyE8qyKDakaYsv9ZTV
	5BNfjHY811wc5S6gE4foQ7A8vFBvV2fc8gBfkrEw=
X-Google-Smtp-Source: AGHT+IHo1qKzQnmzfF/o64hJYDxtDD/NvVmhtDZTM7htbVixxRZrDD5hunCq7w/4cTE8iqUHVlCovjfMSmPYMU/R+Hw=
X-Received: by 2002:a05:6a21:3a8e:b0:1e0:c6c0:1e08 with SMTP id
 adf61e73a8af0-1e5e04a0c87mr105512454637.25.1736243395187; Tue, 07 Jan 2025
 01:49:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412311203.ca7bddba-lkp@intel.com> <CALm+0cWOxUm_hrNe4UP4Z-vyr4RCOw+dc=kCBTgsyjHFHiHDsg@mail.gmail.com>
 <949f6251-d411-45ef-9f85-d5d069b90b0e@paulmck-laptop> <Z3Ym/DDtGOPamGjZ@xsang-OptiPlex-9020>
 <c8c4c6d6-ad52-4cd2-ba1f-c442da4432af@paulmck-laptop> <CALm+0cVbaJuMWMkU4g_6inCKiBVaVD3iixvBrfMJTqZ-3OUCvg@mail.gmail.com>
 <c2561f0c-9bc1-4492-b9dd-655502f101f7@paulmck-laptop> <CALm+0cWoK_+xMxZ1xddZGt9KxuUqkW13fqwtOm9NtBEd+LqBFQ@mail.gmail.com>
 <8f42f7ac-3d5d-43c7-a646-fe46576397ff@paulmck-laptop>
In-Reply-To: <8f42f7ac-3d5d-43c7-a646-fe46576397ff@paulmck-laptop>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Tue, 7 Jan 2025 17:49:42 +0800
X-Gm-Features: AbW1kvaZ3GYQV5H-YCD28ipd1468GTANUUTlpM9y_9r0e0CUkcBzwrmvXbGtSTU
Message-ID: <CALm+0cXXe86aAeyBYnb6z3xBFvLeGxD+yjg_uzBB5PHCG9f3QQ@mail.gmail.com>
Subject: Re: [paulmckrcu:dev.2024.12.24a] [srcu] 9216c28c6a: BUG:unable_to_handle_page_fault_for_address
To: paulmck@kernel.org
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Mon, Jan 06, 2025 at 11:24:54AM +0800, Z qiang wrote:
> > >
> > > On Fri, Jan 03, 2025 at 01:50:50PM +0800, Z qiang wrote:
> > > > >
> > > > > On Thu, Jan 02, 2025 at 01:41:16PM +0800, Oliver Sang wrote:
> > > > > > hi, Zqiang, hi, Paul,
> > > > > >
> > > > > > On Tue, Dec 31, 2024 at 08:19:44AM -0800, Paul E. McKenney wrote:
> > > > > > > On Tue, Dec 31, 2024 at 03:16:25PM +0800, Z qiang wrote:
> > > > > >
> > > > > > [...]
> > > > > >
> > > > > > > > >
> > > > > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > > > > the same patch/commit), kindly add following tags
> > > > > > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > > > > | Closes: https://lore.kernel.org/oe-lkp/202412311203.ca7bddba-lkp@intel.com
> > > > > > > > >
> > > > > > > >
> > > > > > > > Please try the following modifications:
> > > > > >
> > > > > > yes, the following modifications fix the issues we found for 9216c28c6a. thanks!
> > > > > >
> > > > > > Tested-by: kernel test robot <oliver.sang@intel.com>
> > > > >
> > > > > Thank you, and I will apply this during my next rebase.
> > > > >
> > > > > Zqiang, unless you tell me otherwise, I will add your Co-developed-by
> > > > > and Signed-off-by.
> > > > >
> > > > > Either way, Happy Square New Year!
> > > >
> > > > Thank you,  Happy New Year!  :)
> > >
> > > And here you go!  Please let me know of anything I missed.
> > >
> > > And thank you for saving me the time it would have taken to track
> > > this one down.  ;-)
> > >
> > >                                                         Thanx, Paul
> > >
> > > ------------------------------------------------------------------------
> > >
> > > commit 71c893e6d1857d1e4ea37aec557d734a560fdb39
> > > Author: Paul E. McKenney <paulmck@kernel.org>
> > > Date:   Thu Dec 19 16:08:54 2024 -0800
> > >
> > >     srcu: Make SRCU readers use ->srcu_ctrs for counter selection
> > >
> > >     This commit causes SRCU readers to use ->srcu_ctrs for counter
> > >     selection instead of ->srcu_idx.  This takes another step towards
> > >     array-indexing-free SRCU readers.
> > >
> > >     [ paulmck: Apply kernel test robot feedback. ]
> > >
> > >     Co-developed-by: Z qiang <qiang.zhang1211@gmail.com>
> > >     Signed-off-by: Z qiang <qiang.zhang1211@gmail.com>
> > >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > >     Tested-by: kernel test robot <oliver.sang@intel.com>
> > >
> > > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > > index c794d599db5c1..1b01ced61a45b 100644
> > > --- a/include/linux/srcutree.h
> > > +++ b/include/linux/srcutree.h
> > > @@ -101,6 +101,7 @@ struct srcu_usage {
> > >   */
> > >  struct srcu_struct {
> > >         unsigned int srcu_idx;                  /* Current rdr array element. */
> > > +       struct srcu_ctr __percpu *srcu_ctrp;
> > >         struct srcu_data __percpu *sda;         /* Per-CPU srcu_data array. */
> > >         struct lockdep_map dep_map;
> > >         struct srcu_usage *srcu_sup;            /* Update-side data. */
> > > @@ -167,6 +168,7 @@ struct srcu_struct {
> > >  #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)                                                \
> > >  {                                                                                              \
> > >         .sda = &pcpu_name,                                                                      \
> > > +       .srcu_ctrp = &pcpu_name.srcu_ctrs[0],                                                   \
> > >         __SRCU_STRUCT_INIT_COMMON(name, usage_name)                                             \
> > >  }
> > >
> > > @@ -222,13 +224,12 @@ void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
> > >   */
> > >  static inline int __srcu_read_lock_lite(struct srcu_struct *ssp)
> > >  {
> > > -       int idx;
> > > +       struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
> > >
> > >         RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_lite().");
> > > -       idx = READ_ONCE(ssp->srcu_idx) & 0x1;
> > > -       this_cpu_inc(ssp->sda->srcu_ctrs[idx].srcu_locks.counter); /* Y */
> > > +       this_cpu_inc(scp->srcu_locks.counter); /* Y */
> > >         barrier(); /* Avoid leaking the critical section. */
> > > -       return idx;
> > > +       return scp - &ssp->sda->srcu_ctrs[0];
> > >  }
> > >
> > >  /*
> > > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > > index d7ee2f345e192..3bf7f41ad72b8 100644
> > > --- a/kernel/rcu/srcutree.c
> > > +++ b/kernel/rcu/srcutree.c
> > > @@ -253,8 +253,10 @@ static int init_srcu_struct_fields(struct srcu_struct *ssp, bool is_static)
> > >         atomic_set(&ssp->srcu_sup->srcu_barrier_cpu_cnt, 0);
> > >         INIT_DELAYED_WORK(&ssp->srcu_sup->work, process_srcu);
> > >         ssp->srcu_sup->sda_is_static = is_static;
> > > -       if (!is_static)
> > > +       if (!is_static) {
> > >                 ssp->sda = alloc_percpu(struct srcu_data);
> > > +               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
> > > +       }
> > >         if (!ssp->sda)
> > >                 goto err_free_sup;
> >
> > ssp->srcu_ctrp should be assigned a value under the condition that
> > ssp->sda is  allocated successfully.
> >
> > -       if (!is_static) {
> > +       if (!is_static)
> >                 ssp->sda = alloc_percpu(struct srcu_data);
> > -               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
> > -       }
> >         if (!ssp->sda)
> >                 goto err_free_sup;
> > +       if (!is_static)
> > +               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
>
> It doesn't hurt to assign NULL to ssp->srcu_ctrp on allocation failure.
>
> Or am I missing something here?

No, I just think in case of failed allocation, there is no need to set
srcu_ctrp. :)

Thanks
Zqiang

>
> > >         init_srcu_struct_data(ssp);
> > > @@ -742,12 +744,11 @@ EXPORT_SYMBOL_GPL(__srcu_check_read_flavor);
> > >   */
> > >  int __srcu_read_lock(struct srcu_struct *ssp)
> > >  {
> > > -       int idx;
> > > +       struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
> > >
> > > -       idx = READ_ONCE(ssp->srcu_idx) & 0x1;
> > > -       this_cpu_inc(ssp->sda->srcu_ctrs[idx].srcu_locks.counter);
> > > +       this_cpu_inc(scp->srcu_locks.counter);
> > >         smp_mb(); /* B */  /* Avoid leaking the critical section. */
> > > -       return idx;
> > > +       return scp - &ssp->sda->srcu_ctrs[0];
> > >  }
> > >  EXPORT_SYMBOL_GPL(__srcu_read_lock);
> > >
> > > @@ -772,13 +773,11 @@ EXPORT_SYMBOL_GPL(__srcu_read_unlock);
> > >   */
> > >  int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
> > >  {
> > > -       int idx;
> > > -       struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
> > > +       struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
> >
> > Should this be the case?
> >
> > struct srcu_ctr  *scp = raw_cpu_ptr(ssp->srcu_ctrp);
>
> Good catch!  This is messed up.  I am now thinking in terms of something
> like this:
>
>         struct srcu_ctr *scp = this_cpu_ptr(READ_ONCE(ssp->srcu_ctrp));
>
> Except that I broke the CONFIG_NEED_SRCU_NMI_SAFE=y case at some point,
> and need to fix that first.  This commit works:
>
> c10edfa489eb ("srcu: Pull ->srcu_{un,}lock_count into a new srcu_ctr structure")
>
> I am now trying:
>
> 71c893e6d185 ("srcu: Make SRCU readers use ->srcu_ctrs for counter selection")
>
> The trick is to apply this patch:
>
> ------------------------------------------------------------------------
> diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
> index 26ae869865a12..74809a083e2b5 100644
> --- a/kernel/rcu/Kconfig
> +++ b/kernel/rcu/Kconfig
> @@ -66,7 +66,7 @@ config TREE_SRCU
>           This option selects the full-fledged version of SRCU.
>
>  config NEED_SRCU_NMI_SAFE
> -       def_bool HAVE_NMI && !ARCH_HAS_NMI_SAFE_THIS_CPU_OPS && !TINY_SRCU
> +       def_bool HAVE_NMI && !TINY_SRCU
>
>  config TASKS_RCU_GENERIC
>         def_bool TASKS_RCU || TASKS_RUDE_RCU || TASKS_TRACE_RCU
> ------------------------------------------------------------------------
>
> Or run some system with CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS=n.
>
> > > -       idx = READ_ONCE(ssp->srcu_idx) & 0x1;
> > > -       atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks);
> > > +       atomic_long_inc(&scp->srcu_locks);
> > >         smp_mb__after_atomic(); /* B */  /* Avoid leaking the critical section. */
> > > -       return idx;
> > > +       return scp - &ssp->sda->srcu_ctrs[0];
> > >  }
> > >  EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
> > >
> > > @@ -1152,6 +1151,8 @@ static void srcu_flip(struct srcu_struct *ssp)
> > >         smp_mb(); /* E */  /* Pairs with B and C. */
> > >
> > >         WRITE_ONCE(ssp->srcu_idx, ssp->srcu_idx + 1); // Flip the counter.
> > > +       WRITE_ONCE(ssp->srcu_ctrp,
> > > +                  &ssp->sda->srcu_ctrs[!(ssp->srcu_ctrp - &ssp->sda->srcu_ctrs[0])]);
> > >
> > >         /*
> > >          * Ensure that if the updater misses an __srcu_read_unlock()
> > > @@ -1998,6 +1999,7 @@ static int srcu_module_coming(struct module *mod)
> > >         for (i = 0; i < mod->num_srcu_structs; i++) {
> > >                 ssp = *(sspp++);
> > >                 ssp->sda = alloc_percpu(struct srcu_data);
> > > +               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
> > >                 if (WARN_ON_ONCE(!ssp->sda))
> > >                         return -ENOMEM;
> >
> >
> > -               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
> >                 if (WARN_ON_ONCE(!ssp->sda))
> >                         return -ENOMEM;
> > +               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
>
> Again, the assigment does not hurt anything, but in this case I agree
> that your way is more clear, so I will use that.
>
>                                                         Thanx, Paul
