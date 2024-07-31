Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFF21A8BE6
	for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 11:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722426693; cv=none; b=cyS9DpoJ+2c1dnyqTrCJP/a1MKaBeovAiw8T8s84ayxkCcxObW6/6T/n+zLUfOulDyFQbhXc+JL6iX8j0xuUmhp+UyEsevJQ/FiL6LiU2hWh+N/iqPTcbFrjMM3ywehy+SciKFpdWG54tE1IQuUac5HY+5CuGXuM19OUKxstQHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722426693; c=relaxed/simple;
	bh=Z3tgfa0TBZZlAPRPnyhZzHIHwaJAdGwVAItxUYwICbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DA3p2R/VYe0UnOiXm8YIgm6BTZsJzicnTOclF+UW2UbSK5OvpDYik4LsrNQxnBl9mHibZCH5R2yaP9jzR0dXwI1PfAC/BG+Vf3mvqgUDmL9m+fdmC/5ZS67tgU2AJPjRvzonWj+L7LmjQKLxhCe6+Z5jjSe5cnAuYfEh0nN0GQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nlloCt9O; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nlloCt9O"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso17770a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 31 Jul 2024 04:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722426690; x=1723031490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3tgfa0TBZZlAPRPnyhZzHIHwaJAdGwVAItxUYwICbU=;
        b=nlloCt9OjEWIVoinBngC/6/lghLpKwjEQDFf1Qx0H009uCNo8Kz3tHjPkae51RsPVK
         GD+Pgd1rB1KocLIjsLyvcHaTRJCNpqtc+h+Lw0g93nMzvD0MZ90kyv/h73/RE39mrZeB
         NpGEYXjGtK2JmXAX6heOy4RvxvS1hXbxZwMLvaXig6O/+Wnp9qpeMR1cuDN+cqj3YtMF
         pwnWqNKL1nLf5L8k4Y+2hYONYF/ePQIcJztGao1C0HReyJudPF2viXWRwhGnNNybno7+
         rJ/Mxup9DrTpCODKtWZzyito8NyYhPiMU4G2Xg97XHXvsBaq713UQ/iKZgqPcITHcCmM
         kTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722426690; x=1723031490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3tgfa0TBZZlAPRPnyhZzHIHwaJAdGwVAItxUYwICbU=;
        b=Z9r4RUX6Oxf2bFuruiIVA9eYfmJVib+ibf7bU6cDDes84Jp3289P3PrkWO/mwrC6ph
         6APAIXlxdsWJRnaXEvd4Nh6AN0p3Eig42P8O/koLz3s997MC43rXR8ox5VJJacUMAXDJ
         WPHXuaknRm5t0xfSJQfEPhBaSHJMRuEw9PfLK1t0P8cPWpKIm7cxh7sTbBPnTUFnty98
         ADAWHr88Yuw4OO0j7I5AM4cOVksCLYm7ji2oGteWL3NWiV5NxSPWItXfa3daELTa3UHT
         AmVg3yXhYWFueM43Ij0SjOTqmyUPw39AJyNI66cQKp0wZfTkVxYRU6cmBfy/zWlfjWU/
         D+VA==
X-Gm-Message-State: AOJu0YxHWC+vZ2/c7LxlSYTFC655SUNM8yoxYn4v5+CDgql6H16n3Zd7
	2NP2XUDzaTbzpMll5+aasnTrdyq4oLnDZ6vjE8oyCNNZzBsbukVXpe/9vUpMTwSBV1Ejb5oLrQP
	NfmPcxdG+BcXCcHfnt1CWeNtIEI9xlYDzfxU9
X-Google-Smtp-Source: AGHT+IEFYDXyYpJoWInpoepe6+mUIKfvQrYST5WPI+tkPWUXZb8XEaphYz1kVFceAekmtR1jnGomCRwVii39RSA0CCs=
X-Received: by 2002:a05:6402:35cf:b0:5a0:d4ce:59a6 with SMTP id
 4fb4d7f45d1cf-5b58cb9c7e7mr255375a12.2.1722426689865; Wed, 31 Jul 2024
 04:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407311019.5ea52390-lkp@intel.com>
In-Reply-To: <202407311019.5ea52390-lkp@intel.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 31 Jul 2024 13:50:50 +0200
Message-ID: <CAG48ez08Qzvqw+QA_kqm62+yqHeS0G+26C9jLeA7eYUqZMRkig@mail.gmail.com>
Subject: Re: [linux-next:master] [slub] d543c8fb9c: BUG_filp(Not_tainted):Bulk_free_expected#objects_but_found
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Marco Elver <elver@google.com>, Pekka Enberg <penberg@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Jul 31, 2024 at 7:27=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
> hi, Jann Horn,
>
> we reported "WARNING:possible_circular_locking_dependency_detected"
> issue upon v3 of this patch in
> https://lore.kernel.org/all/202407291014.2ead1e72-oliver.sang@intel.com/
> several days ago.
>
> at that time, you said that real issue should be something like
> "BUG filp (Not tainted): Bulk free expected 1 objects but found 2"
> and you will send a fix.
>
> now we noticed this patch in in linux-next/master, but not sure the versi=
on.
>
> we found there are still similar issues so just send report to you FYI.

Right, that's still v2 of the patch - you can tell from the "Link:
https://lkml.kernel.org/r/20240724-kasan-tsbrcu-v2-2-45f898064468@google.co=
m"
line in the commit message, which contains "v2" and links to an email
with subject "[PATCH v2 2/2] slub: Introduce CONFIG_SLUB_RCU_DEBUG".

And yeah, that seems like the same issue that I fixed in v4 of the
patch (https://lore.kernel.org/all/20240729-kasan-tsbrcu-v4-2-57ec85ef80c6@=
google.com/).
v5 is now in the mm tree, so I think once the next version of
linux-next is built, the issue should go away.

Have a nice day,
Jann
