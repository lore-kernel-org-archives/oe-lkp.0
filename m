Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0C69959
	for <oe-lkp@lists.linux.dev>; Wed, 10 Jul 2024 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592601; cv=none; b=i5RmTbKhjDxDmSHw24CIH91UAjWEdos8B6iU2wv1gbKR/6rtkWoHslWvKaTvC5atBQn89tB1Z/eIacSQpEcIEd4zF/jKpEHzo2ocMHyo/OA4JDdRUm62StQlREWIkhOow1aOy3sWH1ek0CJUKJ/wb9lMvRfVllbc4DdUSHeJNVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592601; c=relaxed/simple;
	bh=wVEF8y6xZNB+oKDSE8R24T0vBRM1iZVrY0XO/xNh7GY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAQvCZBLtrjudGgN6tBkxlWTx6RsW9uJuljsVCiXSjYGud3Ut85rnWrTR96HOiF+CRJGtzU0twtSY/yUbMXj/kMsvjm9/oox17FfQA/znIVPx2vTokYKPRtPO+8Geje9t/ji7gZv0IDPcP/w4I00rtOjAaPIYFs2CZ+NFmu0aRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YlkL8Td5; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YlkL8Td5"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-447f8aa87bfso260111cf.0
        for <oe-lkp@lists.linux.dev>; Tue, 09 Jul 2024 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720592599; x=1721197399; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVEF8y6xZNB+oKDSE8R24T0vBRM1iZVrY0XO/xNh7GY=;
        b=YlkL8Td59fHzqo1WyLOxWaUiHVof0aKX6cbTqlRdGgc+3D9Pw0XiL0h3ocGrMs2ybC
         3l6amoFbDSe3wD5mpYOlFTnQxQQ2cG5VCnO7ywKW017vzrl84v7fsPAbuBKNvUIXV3tt
         T7bt3bmJTyFfe2ZvdnFJ4GZbFuJcrlWv7iHoEHzCCnWyK/Q6fjEc6ZuAWq4Z+jVQpxCH
         jrL+w2dhe2oEzEpxV+76CdHHXFtIuwMQe8aVvakESo3yt8w3ZI+4y0vvW9b5m/qNWcA0
         6/XPQ8CBpAe6j9iheo5UELe34fTKem7NfSg+2MeYmbvUISffQeohXnRv5qXWj+EM6kcg
         zXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720592599; x=1721197399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVEF8y6xZNB+oKDSE8R24T0vBRM1iZVrY0XO/xNh7GY=;
        b=Tghlkq2yYxMvrm48NaD1GDsUQFm2R8o6I/+5pSdoGjGZ1uJp6yNi/YssivUWnDdtfn
         hIN63Usr5pESOgNToURntGfVHUKiydw+2Q5TZGrQZEralGlggE0iRCOzy4s5uP9XmdFm
         zwqmnQsAdQEWGYUwk8ZPsD9xmf+JuSTSLoGzoYNWCSf8jbhApj7jFFIQxPSFitsIdK3E
         pxYb9T+d3DZ5r2e59sXu+uuXH3sLfEHSeecqlBk10x/FO60BNo/er6W3/ZwWGwhLgzF6
         aacUXuafwY7W6Sru743IckkFRq+ZI+2fzzwPQI1givvfMtclhmm2zux/J41NVLmQRJVo
         qX0Q==
X-Gm-Message-State: AOJu0YyXCtUcwGg8cWv8KI5Agyx5enGEPO3CaTGrtLmQDbIxYmP1FXcj
	Xsc3vNz7OUsgI1yzLBPbz9ZZn0XZUss0jFvi+FO6uPPsrkhQWyNjc5SaFw85p+BZR/vj3h8Jkl8
	n7RIXmAnU/SolMQ5MOQU0Apj9TrimK6R1pRzZ
X-Google-Smtp-Source: AGHT+IEO2hDzsb7JZgkOy3SSJpcUo7AcmhmbVcZB9D8ZLb/iEgICdqvaoNFDl8Ja4olFYV1ZNcgAvovm39xOVF1n4t0=
X-Received: by 2002:a05:622a:8014:b0:447:daca:4b25 with SMTP id
 d75a77b69052e-44acee81c74mr1902151cf.28.1720592599073; Tue, 09 Jul 2024
 23:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407091001.1250ad4a-oliver.sang@intel.com>
In-Reply-To: <202407091001.1250ad4a-oliver.sang@intel.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 10 Jul 2024 00:22:40 -0600
Message-ID: <CAOUHufYdGbgnqNprKVUH8woMR_R5Wcc=281vcmm3+NRO-=+-jw@mail.gmail.com>
Subject: Re: [linux-next:master] [mm/hugetlb_vmemmap] 875fa64577:
 vm-scalability.throughput -34.3% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>, 
	Frank van der Linden <fvdl@google.com>, Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>, 
	Yang Shi <yang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 11:11=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
> Hello,
>
> kernel test robot noticed a -34.3% regression of vm-scalability.throughpu=
t on:
>
>
> commit: 875fa64577da9bc8e9963ee14fef8433f20653e7 ("mm/hugetlb_vmemmap: fi=
x race with speculative PFN walkers")

This is likely caused by synchronize_rcu() wandering into the
allocation path. I'll patch that up soon.
