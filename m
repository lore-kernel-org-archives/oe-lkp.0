Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730DA4314D
	for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 16:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a2sVH93n"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9f924e0481aso87479966b.1
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 08:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1700238770; x=1700843570; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sWqn8BVZx48aeIBfXi/N03W7SfnJax/+BdIf2xPvMfQ=;
        b=a2sVH93nupmuNT2w7h1hu1Ua9+4l5sy9iUpcMwv1miWyf6ihoPcMRuR7PgKgyYy6Dy
         vvklpTzAn2gPfGaeeifPYFUJW/3e7T64UQYX8CEvBelyXrAbInzgYxI3YGg79rFxcXtG
         MXMdTGdinuRnyKeb85ah4VNjMB5kdKQxazOcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700238770; x=1700843570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWqn8BVZx48aeIBfXi/N03W7SfnJax/+BdIf2xPvMfQ=;
        b=lpjl6wBJ/ca19k+aT8qEps5YcrsccuVV9a00J2N7nDQoWvQYuCXZwGOpO2Fl/DeSaw
         A90r4OOT5rh+pVo4uQagIeH0N2CewnvGNaQuZf60FILXmA0gAfnXoFA0NE9AzMas3VNV
         NqTdjWnzXQmP4Dgoq2LSVgcrerHD+YP4hRM1DOdCgBcjMXctqD6U7cXhntRM44JGLFw2
         jZ+TydDWDth4lJ1HjfL1nAxEc+NSS4CZsrwS3jtqqOF/3gmHM5aIGV76Sd8HCMC6SbRu
         YOQGBPvpsZOriRQ8/MIlT4HWMQUsxxEvZWZ/wDUsRHdeR/TUizttwKe0CZjdaGxdyNCI
         i88g==
X-Gm-Message-State: AOJu0YzijFMLk6lYwxgpkcF+TIC17/djOeelfGVp28J4LldYFiMi4q9i
	B9wfrVWZIuCif+mnc9ZjeRksy+oy83SQJcN4LbFBDcwm
X-Google-Smtp-Source: AGHT+IFx/u0v9ipmjXAv7cqql9aLgTcRz61egZpsz/OcScPo1pBE7gDeT/ZwyWheNYc0kd+QSCZoKw==
X-Received: by 2002:a17:906:e4c:b0:9bd:a5a9:34de with SMTP id q12-20020a1709060e4c00b009bda5a934demr5121081eji.23.1700238770564;
        Fri, 17 Nov 2023 08:32:50 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id la21-20020a170906ad9500b009c6a4a5ac80sm933571ejb.169.2023.11.17.08.32.49
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 08:32:49 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-547e7de7b6fso4221573a12.0
        for <oe-lkp@lists.linux.dev>; Fri, 17 Nov 2023 08:32:49 -0800 (PST)
X-Received: by 2002:a05:6402:1744:b0:52c:f73:3567 with SMTP id
 v4-20020a056402174400b0052c0f733567mr5355762edx.13.1700238768931; Fri, 17 Nov
 2023 08:32:48 -0800 (PST)
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
 <20231117160940.GGZVeQRLgLjJZXBLE1@fat_crate.local>
In-Reply-To: <20231117160940.GGZVeQRLgLjJZXBLE1@fat_crate.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Nov 2023 11:32:31 -0500
X-Gmail-Original-Message-ID: <CAHk-=wj33FoGBQ7HkqjLbyOBQogWpYAG7WUTXatcfBF5duijjQ@mail.gmail.com>
Message-ID: <CAHk-=wj33FoGBQ7HkqjLbyOBQogWpYAG7WUTXatcfBF5duijjQ@mail.gmail.com>
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

On Fri, 17 Nov 2023 at 11:10, Borislav Petkov <bp@alien8.de> wrote:
>
> Which looks like those added memcpy calls add a lot of overhead due to
> the mitigations crap.

No, you missed where I thought that too and asked David to test
without mitigations.

That load really loves "rep movsb" on his machine (and that includes
the gcc-generated odd inlined "one word by hand, and then 'rep movsq'
for the rest").

It's probably because it's a benchmark that doesn't actually touch the
data, and does page-sized copies. It's pretty much the optimal case
for ERMS.

The "do one word by hand, the rest with 'rep movsq'" model that gcc
uses (but only in this particular code generation case) probably ends
up being quite reasonable in general - the one word by hand allows for
unaligned counts, but it also brings in the beginning of the copy into
the cache (which is *often* the part used later - not in this
benchmark, but in general), and then the rest ends up being done as L2
cacheline copies at least when we have those nice page-aligned
patterns.

Of course, this whole thread started because the kernel test robot
then has exactly the opposite reaction - it seems to really *hate*
that inlined code generation by gcc. Whether that is because it's a
very different microarchitecture, or it's because it's just a very
different access pattern than the one that David's random KUnit test
pattern is, I don't know.

That kernel test robot case is on a Cooper Lake Xeon, which is (I
think) is just Skylake server. Random Intel codenames...

So that test robot has ERMS too, but no FSRM, so we do the old
"memcpy_orig()" with the regular memcpy loop.

And on that Xeon, it really does seem to be the right thing to do.

But the profile is so noisy with other changes that it's not like I
can guarantee that that is the main issue here. The reason I zeroed in
on the memcpy thing was really just that (a) it does show up in the
profiles and (b) the commit that introduced that 16% regression
doesn't really seem to do anything else than reorganize things just
enough that gcc seems to do that alternate memcpy implementation.

The test case seems to be (from the profile) just a simple

do_iter_readv_writev ->
  shmem_file_write_iter ->
    generic_perform_write ->
      copy_page_from_iter_atomic ->
        memcpy_from_iter_mc

and that's then where the new code generation matters (ie does it do
that "inline with rep movsq" or "call memcpy_orig").

For David, the rep movsq is great. For the kernel test robot, it's bad.

                  Linus
