Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425517BAF
	for <oe-lkp@lists.linux.dev>; Sun,  4 Aug 2024 20:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722803586; cv=none; b=bpcnLR4ZHEcyEibiUxwfyLVzWVs54J80a/Y8Dn+iPySNjvblRZb9XbIAmtzOHED1ewJi9RsbNErtm8K8o3NtPHuoc8ks0BO8z+ZvupFyn3iWBYOp0HPCRZxuYDJVM7v0VSnyNXHI2pnGBgfAPziU9YaYxhCSDO4lRCDvZJZK9zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722803586; c=relaxed/simple;
	bh=AZliAsMy1KQ0MTCOfVVvKYar8vTnwBzGjMoUW1Wh39k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltRjaLW52d62OKi+a/pfviU/Xvw23eQydDeeu3xNqwVny4CVSSfR/ZjyCAnylixBuHTczH6Vyl0Rlowsus2qwcCD3Vf4XfroPxFq24RDUtYWTjWZOBeXUPzTUmKdD4X4qV/AfhntjwQPYzJ5S8TII94Q5cCNIGtC6brs4UADNDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QU88K3Og; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QU88K3Og"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7aada2358fso815489666b.0
        for <oe-lkp@lists.linux.dev>; Sun, 04 Aug 2024 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722803582; x=1723408382; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LJPoUhGsSbI3MesTWfLPEQy046rL3cbhs+jom/8YIqc=;
        b=QU88K3Og56ECs562y0xlmss9NyzXXA5t5MRiX2clg2mTb8Z+XV/FHyKkC6Mp8XVUPY
         e4CoXUQxK8GU/g1TCNRBEPfyE6Ln9fTi+By+nJV+AHOr9MkukmWQJURM+dqHsDIl6Mvr
         1sHQkhE2PZWT0TEkwUSbLteQJkaLJmPaixON4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722803582; x=1723408382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJPoUhGsSbI3MesTWfLPEQy046rL3cbhs+jom/8YIqc=;
        b=Rm7iY7C932dM3gkFyIxuIljHLUvOfXHbJrDTUBKkUz0kv/RyQINhxuzRnTWacAI0JO
         2s80FwpBRvrX8iuNJdcTOG8etCSlEFZYoNkPrvcI+dOFM3YePLirR7WS90mXOlt/ElrS
         cn7UHS6THy0a9QCTFjoKB9F1X14SqtbqBGTX6p27rkLCRdRHStkLzuox+3cIuc5nJYk/
         dt1Akis9WQCGSIgfO2w49h91MvoGDDHDiQlY7Ne5GRa0O5/IjbKfgyirHhb3SCNq9lBQ
         viHuDfOfRMFkLSQkd1QdqljzhOF4zJinGH0lJe0OpC7BOeNbXOrfUymiKLNR9N24hJj7
         OImw==
X-Forwarded-Encrypted: i=1; AJvYcCW7s4ltE0UhabuwXUJ4OLVTFHo3i1SQru6+jNYHRUOxq7rtuQ7aC7ZGguHpvdDXJX1y3y8wov3YJKUs+35/nFI31MweCbmz
X-Gm-Message-State: AOJu0Ywd0TTxAJji/GM/GWh2n+0vfyBFHSIp8L8gGwDSN1VPcyl76KZW
	OS/4JBybjL6L6zzvoBO5AnNDMbLepPl0i4YRJF9iwBdgq17JKq0RKg6fojXAMNF1Qpx0HcuSy3E
	HLnWpjw==
X-Google-Smtp-Source: AGHT+IGFAiBbopHn3ZGeKPCERWAyYwH0sG7Q62Dt+fUvasQLHkuFAslv4dDSCbOF+OoU2GPKoJIa9w==
X-Received: by 2002:a17:906:bc07:b0:a7a:a4cf:4f93 with SMTP id a640c23a62f3a-a7dc628b8fdmr784805066b.32.1722803582072;
        Sun, 04 Aug 2024 13:33:02 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0ca00sm365286066b.68.2024.08.04.13.33.00
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 13:33:00 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5af326eddb2so8025604a12.1
        for <oe-lkp@lists.linux.dev>; Sun, 04 Aug 2024 13:33:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV5iXOsMd0QfKJ+95FaPkjOg7FlFP8/gXjApaqXs1UMNQ+NJj4/eM/iMp8Q3qzMnZPJoNZzDSULfEYe3sjwYsNZ3npOXb4Y
X-Received: by 2002:a17:907:608c:b0:a7a:1c7b:dc17 with SMTP id
 a640c23a62f3a-a7dbe63440dmr975332366b.22.1722803580241; Sun, 04 Aug 2024
 13:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com>
In-Reply-To: <202408041602.caa0372-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 Aug 2024 13:32:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
Message-ID: <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: Jeff Xu <jeffxu@chromium.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Pedro Falcato <pedro.falcato@gmail.com>, Dave Hansen <dave.hansen@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Amer Al Shanawany <amer.shanawany@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-api@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Aug 2024 at 01:59, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a -4.4% regression of stress-ng.pagemove.page_remaps_per_sec on
> commit 8be7258aad44 ("mseal: add mseal syscall")

Ok, it's basically just the vma walk in can_modify_mm():

>       1.06            +0.1        1.18        perf-profile.self.cycles-pp.mas_next_slot
>       1.50            +0.5        1.97        perf-profile.self.cycles-pp.mas_find
>       0.00            +1.4        1.35        perf-profile.self.cycles-pp.can_modify_mm
>       3.13            +2.0        5.13        perf-profile.self.cycles-pp.mas_walk

and looks like it's two different pathways. We have __do_sys_mremap ->
mremap_to -> do_munmap -> do_vmi_munmap -> can_modify_mm for the
destination mapping, but we also have mremap_to() calling
can_modify_mm() directly for the source mapping.

And then do_vmi_munmap() will do it's *own* vma_find() after having
done arch_unmap().

And do_munmap() will obviously do its own vma lookup as part of
calling vma_to_resize().

So it looks like a large portion of this regression is because the
mseal addition just ends up walking the vma list way too much.

              Linus
