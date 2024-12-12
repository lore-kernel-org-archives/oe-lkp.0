Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF841898EA
	for <oe-lkp@lists.linux.dev>; Thu, 12 Dec 2024 23:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734045495; cv=none; b=lylKltp2u9kzxEqlYKUKpjODh9Rmvgn/MlvbYhcZeJi95LIRfajTK6MkCGpJ8DLBrSennBmFz5Cr2wQorBcvS5O2Ct16zKeU9OUhRqZjG9IkU2R/DLSbvwFGSdYEP2vbZnuUoeaTNQ4mIDje2gbYsUnE42Z5nC4YC8dGL2KMl0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734045495; c=relaxed/simple;
	bh=RE27v71rDFO4U2xlFWx7xqoEPDOJQkdShgyiZkdcDYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bI8Y950qjMM9j0dhYtNfNROvla/aC3Nt57FYrQgcN235vFSk6eLPKtX6JBFxhAaJyOpV6ECjSemvZkP7UBTQ/OxJ/9V89Tsbhsubla7mtE9SGUPT6Sd4+xIAvmSDi7+wVi01qEGl7+kVefn4hl/07TCgg/c0tWldNyDL9S2vbpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uxkup4J8; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uxkup4J8"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4679b5c66d0so35761cf.1
        for <oe-lkp@lists.linux.dev>; Thu, 12 Dec 2024 15:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734045493; x=1734650293; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G37KeGVU6MeLruI7xGjEHGxgNFoI6KkR5tULmzViKWE=;
        b=Uxkup4J8LCPxWlT9/WX1sWGvJ2MuSsQTZRJMMk8eaNjGInRdyGpW2ux3CLqwnxBkju
         cLVIcS3CMXaLw3Gzqtb2Okj+T66YlFziUGVqZBQO4a1/nanaVb+9M7Kt1pUgsHjKkTkN
         ImIes67tFjScSYpGV92EplifLDAs9oMwTwnajvG68A3evYwj0J3E1SPMuahA+oKT6zdR
         4Ne3XIhkUxyxp1LHBj5ZzopY4FO7Aaqr9sPATmM+JNKmXMCCa8ocmq6hNsUYOBZ+xt62
         B8Bs3DV901RGSk8V4x3O20ASc+G8zs/sJD1/ZRcMB+JiDPByDIejSNvh1AyoO7RzruqK
         /tNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734045493; x=1734650293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G37KeGVU6MeLruI7xGjEHGxgNFoI6KkR5tULmzViKWE=;
        b=oKeIMjJAlk7R1czCZkIYcKG7uIxB963WMs8gktzUDZGDKG/HKDnI83RMZFcRcM47hL
         LGkZPe7cLnshbCvSM1CFtoZHjaTlIPm3YOS3wJQ5LqBazBYMO+LG0d2DdP4z+2gBXirO
         gGyAoqM2Gz28naObBrygr8gZWiF8QZwqtQ10UOSAoDCb2PR17xBm9PBMqQgCjG7gm8AC
         PfEjO0pCLneTZyrPAwY8tKxGGHSAeBqXmSnw/Wgv4yEnCOCxHrCnDHIoj7BsNhTCkUf+
         qstKarl8wTMrMmjwRyAorAY5MVm+8I/pDK457XD4G44aN/kHepVWY7A0nrwb3Q07A+a5
         jP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKdf3OCumyZLGjm441ebKhq7x48pCyILDmA007/T2HHgG6GnVh4FRWJD2sZkV/ll0Wnw6HFLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVtItqle8Pj8BJdCNDxYxEXEAlG4OrPvilxTEwY3SgXZSSWKPN
	rgvYGsIPdoxcsotufMY8914pzMnVKev/rm+j8vdCaANHAATkwxR6fqe+cum0l6pcn3/YoHeAqMa
	sviGYeBbdqxrl6i5QNsNF59umw88yZzj+0FKc
X-Gm-Gg: ASbGncuawiR16B8EwzWaLz/DdQJMm2xJ/Qrr/1ZL9XfXyFte350faJBeRU8baSbqi6U
	0kOn3B/WUyU7/gVWWkFE9de8hrpOXPB8ijIvAaPdgxcN5hZkQL+Xbo7KOnzTXjebS5uPt
X-Google-Smtp-Source: AGHT+IHXbfzaYFKE9ku+DcAM7Ci5nnWCXllAeHKK+6mWf5Oyzgov9oKeDhH5wen2fbJZH5ZdLmfgxld+nyBk3WZixDA=
X-Received: by 2002:a05:622a:258a:b0:467:8416:d99e with SMTP id
 d75a77b69052e-467a59d2e1emr411601cf.21.1734045492400; Thu, 12 Dec 2024
 15:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJuCfpGJp-U3t_SHRhuSRTu7Hjkz23oqKSNbVL79O1OQhgJndw@mail.gmail.com>
 <20241212082910.30826-1-00107082@163.com>
In-Reply-To: <20241212082910.30826-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 12 Dec 2024 15:18:01 -0800
Message-ID: <CAJuCfpF2e7niEbR=nX2u0HZHq-7tjRGB=xV397pFpjdzBqUGfQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/codetag: clear tags before swap
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lkp@intel.com, 
	oe-lkp@lists.linux.dev, oliver.sang@intel.com, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 12:29=E2=80=AFAM David Wang <00107082@163.com> wrot=
e:
>
> When CONFIG_MEM_ALLOC_PROFILING_DEBUG is set, kernel WARN would be
> triggered when calling __alloc_tag_ref_set() during swap:
>
>         alloc_tag was not cleared (got tag for mm/filemap.c:1951)
>         WARNING: CPU: 0 PID: 816 at ./include/linux/alloc_tag.h...
>
> Clear code tags before swap can fix the warning. And this patch also fix
> a potential invalid address dereference in alloc_tag_add_check() when
> CONFIG_MEM_ALLOC_PROFILING_DEBUG is set and ref->ct is CODETAG_EMPTY,
> which is defined as ((void *)1).
>
> Signed-off-by: David Wang <00107082@163.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202412112227.df61ebb-lkp@intel.com
> Suggested-by: Suren Baghdasaryan <surenb@google.com>

I didn't really suggest much in this patch, so please replace above
Suggested-by with:

Acked-by: Suren Baghdasaryan <surenb@google.com>

Thanks for fixing this!

> ---
>  include/linux/alloc_tag.h | 2 +-
>  lib/alloc_tag.c           | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
> index 7c0786bdf9af..cba024bf2db3 100644
> --- a/include/linux/alloc_tag.h
> +++ b/include/linux/alloc_tag.h
> @@ -135,7 +135,7 @@ static inline struct alloc_tag_counters alloc_tag_rea=
d(struct alloc_tag *tag)
>  #ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
>  static inline void alloc_tag_add_check(union codetag_ref *ref, struct al=
loc_tag *tag)
>  {
> -       WARN_ONCE(ref && ref->ct,
> +       WARN_ONCE(ref && ref->ct && !is_codetag_empty(ref),
>                   "alloc_tag was not cleared (got tag for %s:%u)\n",
>                   ref->ct->filename, ref->ct->lineno);
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 35f7560a309a..3a0413462e9f 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -209,6 +209,13 @@ void pgalloc_tag_swap(struct folio *new, struct foli=
o *old)
>                 return;
>         }
>
> +       /*
> +        * Clear tag references to avoid debug warning when using
> +        * __alloc_tag_ref_set() with non-empty reference.
> +        */
> +       set_codetag_empty(&ref_old);
> +       set_codetag_empty(&ref_new);
> +
>         /* swap tags */
>         __alloc_tag_ref_set(&ref_old, tag_new);
>         update_page_tag_ref(handle_old, &ref_old);
> --
> 2.39.2
>
