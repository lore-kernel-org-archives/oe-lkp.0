Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8241B28D
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 16:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TGwDAXHD"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9f924e0481aso89651166b.1
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 08:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700239469; x=1700844269; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bs2wsPjA2JAN6w4n7okuC94+1cRA6FNJdtHsM2rFQKI=;
        b=TGwDAXHDJIG9KTFVbdiAvvUkrBQsEqiZ/WFS+5aCiOyIam/gZ+5eC1Y5Rw1amRWZUP
         w9XvJuAS7ktMTONqMp1jpL7V0vkkWAvlEVRETLRFRoI1PDwf27yCyhnB0sXMkXVepFDh
         fynzY1kPWzCb1F2+/0kYmkgCjPUY+grRkfx7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700239469; x=1700844269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bs2wsPjA2JAN6w4n7okuC94+1cRA6FNJdtHsM2rFQKI=;
        b=ZqJSto5D8VMWUgsDMJCCwmsHK3A1IfKgr73Tvzgl83vtwEmmbjXfUuo5Lpw8dqWNEA
         mg/E0xEmwe+03V6A4CyRFTZW/5u/ffZgZQDb9ZPBPmNTLWApvztnDNcVE8vhqsmM30sv
         VWBnNcOIQar65+WXCI8jCgHMrX2eqLVRBDOWq2sfJmjMZevLGsVai5CDsMR2im4sz0DW
         8SUJk+Dg65c3EcXMwkiSlP9DWq62QXOfBnv14t/Acj7siyvcPK34yP6nzRiMFKWqlVjy
         S28mVxH1pH17R7bSYTinVBretHK+fPGWPhArdoBdPlSBmBE/AmbIQji0EmP0rZJlaWxi
         4hBQ==
X-Gm-Message-State: AOJu0YyygCPBT2etzBJfsFrO7ddw+t2yDNIWauHakG0+pAaQGL2nfYLh
	+pu1zUr1ePl+34MVUCL5QH69FEf15HEYujzd11gVQCa8
X-Google-Smtp-Source: AGHT+IGCEsOd5sAhrUuSpvYOE9jOOYzL51o3vDIBC2NmHL4NVZZHAp6D5ud9g+eqTujHqgTR91U45Q==
X-Received: by 2002:a17:906:38da:b0:9ae:50ec:bd81 with SMTP id r26-20020a17090638da00b009ae50ecbd81mr4252004ejd.21.1700239469179;
        Fri, 17 Nov 2023 08:44:29 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id n12-20020a17090673cc00b009dd606ce80fsm972919ejl.31.2023.11.17.08.44.28
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 08:44:29 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9becde9ea7bso663664566b.0
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 08:44:28 -0800 (PST)
X-Received: by 2002:a17:906:24d0:b0:9f1:a725:54a6 with SMTP id
 f16-20020a17090624d000b009f1a72554a6mr5387650ejb.1.1700239468401; Fri, 17 Nov
 2023 08:44:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231116154406.GDZVY4xmFvRQt0wGGE@fat_crate.local>
 <202311061616.cd495695-oliver.sang@intel.com> <3865842.1700061614@warthog.procyon.org.uk>
 <CAHk-=whM-cEwAsLtKsf5dYwV7nDTaRv1bUKLVBstMAQBug24uQ@mail.gmail.com>
 <CAHk-=wjCUckvZUQf7gqp2ziJUWxVpikM_6srFdbcNdBJTxExRg@mail.gmail.com>
 <CAHk-=wjhs6uuedgz-7HbcPtirEq+vvjJBY-M2zyteJwBhOMZhg@mail.gmail.com>
 <20231115190938.GGZVUXcuUjI3i1JRAB@fat_crate.local> <CAHk-=wh0TcXyGmKHfs+Xe=5Sd5bNn=NNV9CEtOy_tbyHAAmk9g@mail.gmail.com>
 <232440.1700153046@warthog.procyon.org.uk> <864270.1700230337@warthog.procyon.org.uk>
 <20231117160940.GGZVeQRLgLjJZXBLE1@fat_crate.local> <CAHk-=wj33FoGBQ7HkqjLbyOBQogWpYAG7WUTXatcfBF5duijjQ@mail.gmail.com>
In-Reply-To: <CAHk-=wj33FoGBQ7HkqjLbyOBQogWpYAG7WUTXatcfBF5duijjQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Nov 2023 11:44:10 -0500
X-Gmail-Original-Message-ID: <CAHk-=whLbJ7vvB1ACVC6t44zjihX8w7GMY2y584+Fm83rsmaKg@mail.gmail.com>
Message-ID: <CAHk-=whLbJ7vvB1ACVC6t44zjihX8w7GMY2y584+Fm83rsmaKg@mail.gmail.com>
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

On Fri, 17 Nov 2023 at 11:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The test case seems to be (from the profile) just a simple

Just to clarify: that's the test robot test case. David's test-case is
just the simple KUnit test.

> do_iter_readv_writev ->
>   shmem_file_write_iter ->
>     generic_perform_write ->
>       copy_page_from_iter_atomic ->
>         memcpy_from_iter_mc

.. and more details: this is *not* the actual normal "write()" path,
which would copy memory from user space, and that uses our
"copy_user()" function etc.

No, the path leading up to this seems to be

  worker_thread ->
    process_one_work ->
      loop_process_work ->
        lo_write_simple ->
         do_iter_write

which is why it uses a regular memcpy (ie it's a kernel buffer due to
loop block device).

So the test robot load is kind of odd.

Not that I think that David's KUnit test is necessarily much of a real
load either. so...

                  Linus
