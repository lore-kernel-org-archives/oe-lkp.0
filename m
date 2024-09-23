Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DB83D556
	for <oe-lkp@lists.linux.dev>; Mon, 23 Sep 2024 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078094; cv=none; b=qBWXFfhR1/ujGua3N1FKzAkMzIsyPNTctl8mndBskPR+NfviLIbvNFy69KbjbhTXAcQqLL9mFxCk9CSBtvzr3dsiQPQJI5WAiph0gAEMogYibuDXsWHGE6eA0TZHZblz4ibZ1is1k+y2fmkpwcZpkEMR+8zDuvjq1aP+wDvmTYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078094; c=relaxed/simple;
	bh=kQLqvXxfar13/dE2X992gYRg93pcxmdGvjFLCvO3qSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaZ0v1n9N69+rQnXCavz4M/LJ+QzM8RoKLWQF10G+4f8O0h33QY6AmAez0SOVNmlnb9NDPSQDKw4TvAzsXM3K5SdaQUMrA1JOpc7efSfBt1JBRbSfi+wkJeSHQi64vti2OJVCdCK3j4t+PivgvVFz6uXBwRm8LxKgYEf4Qn0rEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=icorBNNh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="icorBNNh"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c962e5adso2379624f8f.1
        for <oe-lkp@lists.linux.dev>; Mon, 23 Sep 2024 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727078091; x=1727682891; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQLqvXxfar13/dE2X992gYRg93pcxmdGvjFLCvO3qSA=;
        b=icorBNNhIxzYRD07Zbw9Q3z7SFrwzfLTtRFqh13HfA3ern5P7pPn6/QtJUQQ+SieBP
         /kQmtFKjXpd6RlomC2V3yktoprU+fvQC/kt1s8X/dyW/RqAjLpCC9UIQYdaAyK5QRc4t
         t8meVWfZK2NVWUFBGy6EvHiWc4OesxXj3zrVkQH2vF11BVhWb9uKWc9JJ7NY3xBgWd9G
         ndH1TMafpTY39xLarxstmpJur8rCs5QM/DrQQbt8TnhvxTGCV2JBZ8FdKolL0briR4Vn
         rV2T9AOZ8LRLvHm8WNfan+7nWoY7zej8KNjTF0uODZeMmTp25y8D6EOH+vri8ZiVMknC
         0OBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727078091; x=1727682891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQLqvXxfar13/dE2X992gYRg93pcxmdGvjFLCvO3qSA=;
        b=Z5PUp9HPYsBTUVhPD4NQSy9hZNXRhWF3+OfQIYAEmEFTMeuLRcne0WArAhe5nIhdcZ
         bH0J+zbrwSp1fjHwp2V7B0CBCBAh3UwK5bekzY1f911/RVBSMavkWdrXzfMy6ZkE9oCJ
         b3NwIIx6kXWdXHCMIKeiUiSCVCLFPNxaVhHgSCjQ/pqwZe5Q0V+DhKR6lTibe62JmUd2
         UD1sb3W8y2bM4/WyIAPusbgOy16muZ1nk6mLK1zdBNU3kSUbT0Q7mj3EXmFORfp3+31j
         K1kNVd2TMiTv6rdpUrHh58kpTJA/R3LyjySdQlwNw4TfgN1KNFNEB+QdCx8dVlMqTE19
         T19g==
X-Gm-Message-State: AOJu0YzjLfZ6lZnNXy/8VxgLuoSp97Chek4yhsJNA8FZEwXK7JmKcgHn
	r+d06EPhZm8Nwz+q5fDByIfveFhp9RFVzbibxPYxe6jeUfysgeKH+mRvMfkX4kz3U6+4Dofuqe3
	VH75eVYyktWhT9qPxeMMv+DsdcdyKkZUh9N9e
X-Google-Smtp-Source: AGHT+IGcu1iI3RhvLnQNs/RGwGpVv2dlXLHZmLTZXX5UKuX8D+yStN7YFyEeRfi9inoJZgWZ2+Vu6eGAVRkYgMRGeTE=
X-Received: by 2002:a5d:4f05:0:b0:374:d006:ffae with SMTP id
 ffacd0b85a97d-37a41497226mr6751368f8f.6.1727078091332; Mon, 23 Sep 2024
 00:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409231044.4f064459-oliver.sang@intel.com>
In-Reply-To: <202409231044.4f064459-oliver.sang@intel.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Sep 2024 09:54:38 +0200
Message-ID: <CAH5fLghbP3KZjkBbQe_MMJrnRpk4M0Hn0nu=uRtKWKqmKz6OeQ@mail.gmail.com>
Subject: Re: [linux-next:master] [cfi] ce4a262098: CFI_failure_at_do_basic_setup
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 4:35=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
> Hello,
>
> kernel test robot noticed "CFI_failure_at_do_basic_setup" on:
>
> commit: ce4a2620985cdf06c200ec0b6dce80374237697c ("cfi: add CONFIG_CFI_IC=
ALL_NORMALIZE_INTEGERS")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 62f92d634458a1e308bb699986b9147a6d67045=
7]

This failure is due to an LLVM bug that causes
CFI_ICALL_NORMALIZE_INTEGERS to be incompatible with KASAN and GCOV.
It has already been fixed upstream:
https://github.com/llvm/llvm-project/pull/104826 (thanks Sami!)

However, we may want to look into having Kconfig detect this case.

Alice
