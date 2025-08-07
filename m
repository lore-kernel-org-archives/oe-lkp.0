Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBDC20299E
	for <oe-lkp@lists.linux.dev>; Thu,  7 Aug 2025 18:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754590078; cv=none; b=RDMTAxLYj+FFr8wX4VIbLNAT6eoCd1L9Moa+hRsthrhLBwcToTyMb7UxQrLNZACkIyI1yIOQ+lVpe0PgIZIQkVqpzlpGOhjpaw97YTDCDbBps4kXxEkKhRDmiaOEIhEa7vnsOimMAJv3o5snipAb0GL7z4IsD9/ztZAjiXdWK5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754590078; c=relaxed/simple;
	bh=OJjrlRJdnoSfaEsthcGrvehuO++RaWyGHz6KW+JMhbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GagQQ/zGA4yzKUa1sIdLF3Ciu+0SoY7PY7e6sXCJzdBNH/KcJytcsB6VCe3W4eWD10N9dv1Lk10VcTb7xAATXPqIp7xNjr5Zq1rU79EopEky2CurVigPkIqh7/4AMBvC8ng9A3zJXZ5UI21ANSbbXfMdWKHBFM5gTJPxtMrDLfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RxN14aRK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RxN14aRK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6156c3301ccso1327a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 07 Aug 2025 11:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754590075; x=1755194875; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJjrlRJdnoSfaEsthcGrvehuO++RaWyGHz6KW+JMhbA=;
        b=RxN14aRKGvfuG9r4gzngIN/3UFpqzZ264OP7tNL/bxzcJx9/cuMOCoUJWmEpAIy2M5
         Cj2bDmbwGfJ4HDtlOHr6shgaKLsiQfA5ucjXhEXo72nr9uMCb7RtyXQ8bJIz7d7VViKf
         50gVYUskWplG+nAhkuLYIOX5KKTRlPj7EPSpTuAknM+UN3qoqAPgW98NT1G94Una4MeH
         CbQ4JYsGgCiwzZmTWBTEz19nOZDtRiYDBH0ani66hAJ6CJCJ6madLFDC0CFVDSzyw0Y9
         XfQkn515uva2YK6w1e57R108FOnHAl/8b5MN7u4SKJUe1im5KpvGviQhXFke2ZF4GJmm
         +VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754590075; x=1755194875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJjrlRJdnoSfaEsthcGrvehuO++RaWyGHz6KW+JMhbA=;
        b=shdNfivPYq6mbLWfvdbkKH6w7Zo8O6GUx4c+UADhCMN3XJ4v/NUrtkTPt2WxHjVnop
         FZIZLPlr9u1GdwXLQSYnximZGUyi9gySbwCmSfo5OK6YaONF6Y6Lxi+N09qmns2eGYlu
         hrqmG8L4xsDrnSlIOTKi9fCNkZcQKMh6pGaV2kK75z++ll6a+mfGV2YNnjgOvtoBBRBE
         SP0WHHSTVy3O0JvL9vere4nz4BDgnsAPIILaLu84/ixpMfydQH0JbdS+aWKtIl7WRTB8
         Ksu7+4LP4V9WvbX8oLhZlMaKq9xIaSFC5ylejjw3DA1lbrxMhK9PDb93TWDDDMhLWwxY
         A86A==
X-Forwarded-Encrypted: i=1; AJvYcCVNNi2pmjiMmyat+bh/9xPzqfMFztnO0lstoyaZsDzMHF9RdSC4MNtOfY/V2yHx+HOzr+PVFJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxzouzyOZcuaAJ62nOjoCmLNxi+fDoZyEeFjNFaIowTPZcHTNp
	jolbVwnPEEiU64FIhs7+9OoXE16epzX7addPctXAInZDZyOn2u3f6KaRHGOMh6gO8B8NwsbORxz
	KoQZsrhxta6SNeBkUrg0WhI12+Fk/A2c4AvBSDxKU
X-Gm-Gg: ASbGncsBx/N+zeNVqqhCc61N+aMNb3X+lpGthMBhSfv0I1PMGcgy/H8rrN3w+LdQaGb
	e8DUHRrV4PJ8iBQZ1Bu9CLkvqwmd7LaV3koFykQBqdToSY5SfXymV2+AraiNvtHrPMUmf9GVZD6
	+fF2GCgAznfX7JB36iVgPIqNE25Rc0FSu2KzoIV+KE8Tq4lV8G6HhvF5kBknMGiejqWtcr8XUx8
	neaWz1V4GRaHVdmplh0bcrIm3TU3dE1kkXGcRvkuG3hMA==
X-Google-Smtp-Source: AGHT+IEvzSpesfYkgCCAObC0Xg+i6NHA/CnpVU4+05f2BuAcOX+avD3vpz0PZpZe3fpUS1se60bl8/syKu6NXlsQlSk=
X-Received: by 2002:aa7:c40b:0:b0:615:49c4:893f with SMTP id
 4fb4d7f45d1cf-617e1500d80mr6028a12.2.1754590074764; Thu, 07 Aug 2025 11:07:54
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508071609.4e743d7c-lkp@intel.com> <9e3a59b2-11c0-43ca-aff3-414091f04aa4@lucifer.local>
 <CAG48ez3=8f3eShjAe9hrvivP+Dvyisw=X_Tr_phc-OX_4MzeDw@mail.gmail.com>
 <be074809-e1fd-43a2-9396-8f7264532c4d@lucifer.local> <CAG48ez3=kLL4wBxAVSa2Ugrws+-RFQMdNY9jx5FAdbhpNt8fGg@mail.gmail.com>
 <e4f5faea-ccec-4cc7-83de-1a3c7013b81b@lucifer.local> <cbc2e23d-69ab-4820-9942-c7abf2066ff7@redhat.com>
In-Reply-To: <cbc2e23d-69ab-4820-9942-c7abf2066ff7@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 7 Aug 2025 20:07:18 +0200
X-Gm-Features: Ac12FXzrdHLe93hwXByTP7b5qoMtUlDB28KMIEXNNyEkjC99e8lIwwa1vdl72oo
Message-ID: <CAG48ez1vM35DZ=kTSd4+ndgR6y33AodLLC2KbfbhGrkDaqdnNQ@mail.gmail.com>
Subject: Re: [linus:master] [mm] f822a9a81a: stress-ng.bigheap.realloc_calls_per_sec
 37.3% regression
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, kernel test robot <oliver.sang@intel.com>, 
	Dev Jain <dev.jain@arm.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <baohua@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Bang Li <libang.li@antgroup.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, bibo mao <maobibo@loongson.cn>, 
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@kernel.org>, Lance Yang <ioworker0@gmail.com>, 
	Liam Howlett <liam.howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Peter Xu <peterx@redhat.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Yang Shi <yang@os.amperecomputing.com>, Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 7, 2025 at 8:02=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
> Sure, we could use pte_batch_hint(), but I'm curious if x86 would also
> benefit with larger folios (e.g., 64K, 128K) with this patch.

Where would you expect such a benefit to come from? This function is
more or less a memcpy(), except it has to read PTEs with xchg(), write
them atomically, and set softdirty flags. For x86, what the associated
folios look like and whether the PTEs are contiguous shouldn't matter.
