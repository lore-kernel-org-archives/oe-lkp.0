Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1814A4E9
	for <oe-lkp@lists.linux.dev>; Tue,  4 Jun 2024 17:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522519; cv=none; b=hf9mNynJU5AfEx49hwNca5+thG5iigt6i8GUfN2LFJkPj0aczcOQuFOdP9VQ6JgCwwSDet+kk2x2Ayh31Vg9nNVAJcoYH6eoFE3ZqogZLfUn4Fh03XRnhhsDN5TVBMvauoVmBZaM4f22TtrzFiA+koIpLGD911giUhYv68BnaW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522519; c=relaxed/simple;
	bh=lxElhNb6+LLAOwSRzJUjOlUE1gCjxcVourbCmwIjDc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lc+vlXvY3R3aItql1my6aHv0UK2KjSjpP4bGwuotKtsl+6zSt4CT/0Mhy+H0DPRLoIsZ9ezfsT2aH0oO2OT4UYSZe5q5vZplmkcWQfEfKFupvOuFHVC9E6bHJdbzfSDT9YJhRhIjBdOdYst9mBL2w5a0Oj54hp6I7Fnl+sUJuBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBua7nzm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBua7nzm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-572c65cea55so108777a12.0
        for <oe-lkp@lists.linux.dev>; Tue, 04 Jun 2024 10:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717522516; x=1718127316; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QnqJOAf1Q2Nckvls20fL4xWcgC3Wkf+wvlijKAtyrII=;
        b=WBua7nzmVrfHc13endcHWx0Jty1ZWq5DxthmD1ZitBCKQLR6dejHTJAdSD+TR2WsiC
         h2AhWxkHeSJETnmKftVEVgusWhDnqUku+SLfD7Od1Lm0Hp9FQETCVLNL1qhGJaROhYka
         M/8yKVtMh1TRogebC13VBgisbd4nC655AuC9k9Gb22AuiQV5vjjDLncvtYpPouWWNFGJ
         jORT41N1dpS5DtqGOK9Ysq5k6VihUQiH1kFtwoS9EvAvrnhtEP66QbVBCLukd4LmGwA4
         itbw71jL9JOKLMdLl2oCHBZ7q9lhdaFaAlinchwMFGg2J0wPUVv2GIzOo4lsstFpehxN
         GOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522516; x=1718127316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnqJOAf1Q2Nckvls20fL4xWcgC3Wkf+wvlijKAtyrII=;
        b=coaGHmXKWTOQdPZo75Ct5VgkYURGwcGPf6o/HZ5CK4sWhdhR2nGASceIx1cLGgvdXO
         2TwUH9hZ7VBqjEuXMxuFTOipamhPLrwFked4IKoPHlssGaryPUxyNL+rTkgiH65ElWgI
         /nAGGORhJh3LFrNZKX+NZ6tV2+HQz5hH4OTyoaKYCLcG1OkfPPF4WXkwchcGIPmiZkxV
         79jJKZdAAvy+vTaqUqrr/JEKAAKV1K/WFIDRBTmZXrZ6ivPKkVJtg/JW6ne1pyYR9nGE
         geSi2G47fNVDO/s/nonyVk/oZ4EefrY0WIbhXL5gvRynFCDVDbx+cSXUeGbd39HuHT7/
         ikZA==
X-Forwarded-Encrypted: i=1; AJvYcCWeum/SAXvh7yUk2+VVjsFgS/YUrsyWAQuKnXsugFtoO6smcnqQFwrpjYwlLg8IX8yR8opI+b1V4NZnVOdnJae9WhkWvCed
X-Gm-Message-State: AOJu0YyBhDZ7oBHzI+KESH7DbkQDPr0l7+8exSXpCzq0sDLtpwwIqbb8
	cXHuSlkuhzg4DItnlEbTm0I4jcOp7L1RWFleuORAJg+MdW1h0G+Dqc8oLhBMzjpEIcSqOwvO8ZP
	aA839s0ku4rdfdGTq88xhdcA9HfQ=
X-Google-Smtp-Source: AGHT+IHXpNuf2BcjrXTd+QUegb227fWnqENFLc7DunocDDJ5GF80C+wRoVoBVJRNKJ8qmzJC/IrELCqiSRzMfhrbbvQ=
X-Received: by 2002:a50:a414:0:b0:579:c37c:1b36 with SMTP id
 4fb4d7f45d1cf-57a8bcc896emr242557a12.17.1717522515985; Tue, 04 Jun 2024
 10:35:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZlpcRnuZUEYJJ0JA@x1n> <CAHbLzkrRw-xf819gYJwRQ=-u971LQYnB2FNJMkN=s6u-pJ4Z8g@mail.gmail.com>
 <CAHbLzkoB+oFTxtVYpeXQvko2q9HUVzUYrr83S6M6PUmXDQpkag@mail.gmail.com>
 <0edfcfed-e8c4-4c46-bbce-528c07084792@redhat.com> <Zl3cakfiRsPQDb8q@x1n>
 <8da12503-839d-459f-a2fa-4abd6d21935d@redhat.com> <Zl4m-sAhZknHOHdb@x1n>
 <9d9a5730-161b-4a9d-a696-1cf6d0c5123c@redhat.com> <Zl4vlGJsbHiahYil@x1n>
 <54ce029f-b16f-4607-bdf1-a1efe904029a@redhat.com> <821cf1d6-92b9-4ac4-bacc-d8f2364ac14f@paulmck-laptop>
In-Reply-To: <821cf1d6-92b9-4ac4-bacc-d8f2364ac14f@paulmck-laptop>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 4 Jun 2024 10:35:04 -0700
Message-ID: <CAHbLzkpuZx7cHoY6vLyetJ9T+KJrTKi1vt=wFv8YMhab7awDxQ@mail.gmail.com>
Subject: Re: [linus:master] [mm] efa7df3e3b: kernel_BUG_at_include/linux/page_ref.h
To: paulmck@kernel.org
Cc: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>, 
	kernel test robot <oliver.sang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Christopher Lameter <cl@linux.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

> >
> > I chased it further to:
> >
> > commit 8375ad98cc1defc36adf4a77d9ea1e71db51a371
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Mon Apr 29 15:06:13 2013 -0700
> >
> >     vm: adjust ifdef for TINY_RCU
> >     There is an ifdef in page_cache_get_speculative() that checks for !SMP
> >     and TREE_RCU, which has been an impossible combination since the advent
> >     of TINY_RCU.  The ifdef enables a fastpath that is valid when preemption
> >     is disabled by rcu_read_lock() in UP systems, which is the case when
> >     TINY_RCU is enabled.  This commit therefore adjusts the ifdef to
> >     generate the fastpath when TINY_RCU is enabled.
> >
> >
> > Where Paul explicitly restored that fastpath for TINY_RCU instead of removing that code.
> >
> > So maybe Paul can comment if that is still worth having. CCing him.
>
> It is currently an atomic operation either way, though the folio_ref_add()
> avoids full ordering, but that is immaterial on x86.  Some say that it is
> in the noise on server-class ARMv8 as well, though they have also said
> a great many things in the past.  But if that is true, the big benefit
> of the TINY_RCU check is that folio_ref_try_add_rcu() is guaranted not
> to fail in that case (single CPU with preemption disabled).  Except that
> everyone has to check the return value anyway, right?
>
> So the usual advice, unsatisfying though it might be, is to remove that
> #ifdef and see if anyone notices.
>
> After all, both 2013 and 2008 were quite some time ago.  ;-)

Thanks, Paul.

I will submit a patch to remove the #ifdef as the fix for the bug
report. And do the clean up in a separate patch which is preferred by
David.

>
>                                                         Thanx, Paul
