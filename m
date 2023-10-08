Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0E920E1
	for <oe-lkp@lists.linux.dev>; Sun,  8 Oct 2023 09:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1ANw8EF"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bdcade7fbso615456166b.1
        for <oe-lkp@lists.linux.dev>; Sun, 08 Oct 2023 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696757368; x=1697362168; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OABQteG0diB/a10SIinmyQPt6vzd3GItMqWnEkzIryM=;
        b=J1ANw8EFkpmwgQb1P8G4hKY/rwCH4d0Og10mKQFToZ+z/74C9FPB36dsNddRNTLt31
         Jj998NlMIqTFNqq9LQktaW3JMVEUVg2aB1UTugJi1XnduuLbIbv5VwyxdMGgzwghy7Vy
         Mtgpygptj74MyQh7pYK+X21csxrFqrf7jrcu69q8fPCSaWtr/2unijyFZGmSv4rk0IjA
         O9oeIXknVr2LbbJxlE4XnUXVwJ8ytqzPzbdOPwKTj3N6VD9yRgjglM7cJurhW5xS3KRd
         3zfXgyuP4IyO+d4H4s+GTT8Lx/r515tQfPcRgSDODzOSWpFl1Z8413+x0tGIf5xoG96V
         nkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696757368; x=1697362168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OABQteG0diB/a10SIinmyQPt6vzd3GItMqWnEkzIryM=;
        b=AZLm+WFG1TQM4JQykxZyIpoaOXMvv9FDDNnBprCT7YKq3YJUjbJlbdOgB6o/ZAfV8l
         nRCSPWa9bA4685zILD3oXYCyz3186ZHbsWNebWAM6gMSvW07c5yKtlFOU15oqIMBgU4G
         WSYL+5Xkgfkm+54PKNAvW9wVSs5Lgc1eP29YoOm5/amrEalskM9wDacGrUi6vOG7+Rg1
         a/b/dzW6Vw2pEx3f2EW2VbCnzFj1YyIJ1WBQvnBxejemWLEvjpx95/wIG6sM/j3WIFde
         THW88N9SRBthP1z15LOLKCVHWvWGWopb3sNN2nqmVFgqWYvA+8jwgvs/Q4eBXWF3CX/o
         +ZjA==
X-Gm-Message-State: AOJu0YzxOuUnXgE2jAv8KG2T1/mJ1z+hGVyebto5fVZtxrSqHXgicrxC
	J/EW/FsPKdIRrdf7nCZH6qI=
X-Google-Smtp-Source: AGHT+IFjab5KAUzDmrJVlW/Zf1y4+OvtG1gWfL7/Z3KxRqpjAzfh4AHbu8X24buZkJ9ZmGlLvRvEGw==
X-Received: by 2002:a17:906:3f04:b0:9ae:5568:b6a8 with SMTP id c4-20020a1709063f0400b009ae5568b6a8mr12489378ejj.10.1696757367584;
        Sun, 08 Oct 2023 02:29:27 -0700 (PDT)
Received: from gmail.com (195-38-113-164.pool.digikabel.hu. [195.38.113.164])
        by smtp.gmail.com with ESMTPSA id sd23-20020a170906ce3700b009b2b9af0784sm5273282ejb.110.2023.10.08.02.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 02:29:26 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 8 Oct 2023 11:29:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>,
	kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	Nadav Amit <namit@vmware.com>, Andy Lutomirski <luto@kernel.org>,
	Brian Gerst <brgerst@gmail.com>,
	Denys Vlasenko <dvlasenk@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Josh Poimboeuf <jpoimboe@redhat.com>, linux-mm@kvack.org
Subject: Re: [tip:x86/percpu] [x86/percpu] ca42563486:
 BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel(entry_offset:#)
Message-ID: <ZSJ2dIRNvgfrOrpZ@gmail.com>
References: <202310071301.a5113890-oliver.sang@intel.com>
 <CAFULd4bUu=wVhH8AweOPycEw2QsbFWSjP8ytr7SM6Z5WLOdWsA@mail.gmail.com>
 <ZSEtmiUERKp1+KX7@rli9-mobl>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSEtmiUERKp1+KX7@rli9-mobl>


* Philip Li <philip.li@intel.com> wrote:

> For this report, we have found a possible boot issue on the reported 
> kconfig as compared to the parent commit. You can kindly do a check.

Thank you for reporting this - I've excluded tip:x86/percpu from 
tip:master for the time being, until we manage to fix the bug.

This should address the boot crash starting with tomorrow's -next 
integration.

Thanks,

	Ingo
