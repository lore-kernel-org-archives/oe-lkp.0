Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5493286B6
	for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L9XOBOYM"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso5768166b.1
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 11:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700076383; x=1700681183; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=shjpDJFgEA7bY447zVelsVqtgQ9wtQbPGXjY7wm8MLo=;
        b=L9XOBOYMQMC5wt5Ha3wCs6+9zOVaFJFvVRoqU7y11uWqAqvkTLjXTHatnKpCLnq3J+
         TNlJVRRN/D0Yq/4CrG8qeaTmSl53PzHnGcfNR/+9D2DY9ChP8ry//SBFUznpQ4XwpPn0
         2Hpg9vgPBbGz2bWX7+LH89iMYuSMyLZZpMCe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700076383; x=1700681183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shjpDJFgEA7bY447zVelsVqtgQ9wtQbPGXjY7wm8MLo=;
        b=YiXgt8PssV10LT+slYtbp//A901+PzIYNrtKQeSqT0vcBVSs4QlWJgT/kLM4TMwnZM
         8Ai/lXUpapieBo1UVy+mzI6m8EbWSOhp3Vu8dYIPSEeLOn8TZBmO3AAVdF4erXRyZIdQ
         SQOR889KYsI5bJLSdFhO0hSZIqIxVsmCrn0AIKid+SwpY8y60de3LBQosFjJ0EbTxk+L
         u+XNCZIK4HDba+g+GOSyV9KE1WKsgTpFoWYk+ZMQSces2BZ3JFm62pc0wyuYrc9yVfYx
         hvN+0T3u8uN6RCB6mh8mCY1CuEKOtPjuGuyhDw2CcM6VSpudiH4MKT3Kmat4XM6BCKia
         zorw==
X-Gm-Message-State: AOJu0YzhkkWYKeX/wizEewwn2VAdl/xVBFyUV1WEo52je70cg+RobGtm
	aB1pIEeI6nE0vvQqWNLD1q1IogtbDTn+zc8F2Lu+hu31
X-Google-Smtp-Source: AGHT+IG2Sh+Njx75HzEG/nUWeEkXNUUBCrqJlsNBnWRObHRxyJTxqVamF9w89gjdZuegozQJ0KG3qg==
X-Received: by 2002:a17:906:4b4d:b0:9bf:70ea:6926 with SMTP id j13-20020a1709064b4d00b009bf70ea6926mr10424517ejv.2.1700076382993;
        Wed, 15 Nov 2023 11:26:22 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id o23-20020a17090611d700b009829d2e892csm7580702eja.15.2023.11.15.11.26.19
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 11:26:20 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso56477a12.3
        for <oe-lkp@lists.linux.dev>; Wed, 15 Nov 2023 11:26:19 -0800 (PST)
X-Received: by 2002:aa7:d545:0:b0:543:6f8e:58ee with SMTP id
 u5-20020aa7d545000000b005436f8e58eemr8359172edr.41.1700076379472; Wed, 15 Nov
 2023 11:26:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com> <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local>
In-Reply-To: <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Nov 2023 14:26:02 -0500
X-Gmail-Original-Message-ID: <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>
Message-ID: <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>
Subject: Re: [linus:master] [iov_iter] c9eec08bac: vm-scalability.throughput
 -16.9% regression
To: Borislav Petkov <bp@alien8.de>
Cc: David Howells <dhowells@redhat.com>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Christian Brauner <christian@brauner.io>, 
	Matthew Wilcox <willy@infradead.org>, David Laight <David.Laight@aculab.com>, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 14:10, Borislav Petkov <bp@alien8.de> wrote:
>
> > Borislav, see
> >
> >     https://lore.kernel.org/all/CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com/
> >
> > for some truly crazy code generation by gcc.
>
> Yeah, lemme show that to gcc folks. That asm is with your compiler,
> right? Version?

That was with gcc version 13.2.1.

Note that I only see that crazy thing in lib/iov_iter.s, so I really
do think it has something to do with inlining __builtin_memcpy()
behind a conditional function pointer.

In normal cases, gcc seems to just do the obvious thing (ie expand a
small constant-sized memcpy inline, or just call the external 'memcpy'
function.

So it's some odd pattern that triggers that "expand non-constant
memcpy inline". And once that happens, the odd code generation is
still a bit odd but is at least explicable.

That "do first word by hand, then do aligned 'rep movsq' on top of it"
pattern is weird, but we've seen some similar strange patterns in
hand-written memcpy (eg "use two overlapping 8-byte writes to handle
the 8-15 byte case").

So the real issue is that we don't want an inlined memcpy at all,
unless it's the simple constant-sized case that has been turned into
individual moves with no loop.

Or it's a "rep movsb" with FSRM as a CPUID-based alternative, of course.

                 Linus
