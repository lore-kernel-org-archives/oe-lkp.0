Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0C768FD
	for <oe-lkp@lists.linux.dev>; Thu,  9 Jan 2025 22:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460123; cv=none; b=jVmqXz28nKKnxEyxQh/gbSnY2VSyXiRpYMyk0SRTUGs2ATiqh/DVMJI7C/jt0uK2DZC1T06zdSDglg52uZZYdeTYWjadReG+Jje26f0VYz2YxIIX87xdLoBrwZImwW/zs08EzBlg1o50nguUC+lG1bJNS1FqOJvEP530etLbUEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460123; c=relaxed/simple;
	bh=I84WSSh6DQ9a2mtoAMAdJUgHoCQtDE3yDVIXOTBFj8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guGq9APPBx6pNH4C9p4nmvqSlFSFgLrvLUFkhrXSctjPY2v9E9miSgDPcQTR2l+xsvNBaFA/XXOA7IimvldPqhyGu3DsGftTTvcy1F/WuKpUPI8XzwR4Qydp6YAieiBlqroVHCnM4vGELvL9T4QZPmb9dbSRXh/6w7nmkiVRDfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpWHY4Jv; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpWHY4Jv"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so2722168a12.2
        for <oe-lkp@lists.linux.dev>; Thu, 09 Jan 2025 14:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736460120; x=1737064920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d14TMngvOZ6r/5tUkuVtbSF7X2ZIEAXABzVrVVasdpI=;
        b=DpWHY4JvG5kGOUD/qK8rODRK6RYlDGH8NGAZgN1pwN40GaT+N88gluVMIkEZOE0G6d
         eEOH2Y8P5b9U2htObnFcmQhWRf0dB2Ff4RIYlKy9OM6rIJdXxVQ8XIu3ED55DMl62bSu
         rtnqy3s8l+9FVea3yO7Ze/LIFqGSyAnEtV3zi74eHI7yWn+m+SPv6qvH2qBzRuXK4SwG
         FWoh90e0wd0TRO61QNopyD10/zvdJBejvIpqssxU21N/9USho5zjCXLZZDcPYVoQcWT9
         llG/zEO+Fq30IDBiiMm93jwUNT6NNkL91II5f4a4iOyXQr4PqU9O4tbwOpR3Cc9357gR
         lwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736460120; x=1737064920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d14TMngvOZ6r/5tUkuVtbSF7X2ZIEAXABzVrVVasdpI=;
        b=qfRw6iNn58CJn2vH2XKdDbWs50HMvWZzTi29ycvuFw1Z1whg2a9HbjD/BF6oELSUDV
         wNvzfcnN0HOiuBisLbD9QtYspfkhHQlwQo1nWmmuSlv18CAZsvj0PSS7HsOjroqj6Prr
         aO7Dm/ZAKtoYwwoyIRfdjVTCJaTGiZHYisvktiUPUuooUEhd1iDbb3+BWNSfYhAICS2J
         TuGgY1+kNy3wyuNrLXyLttUXBZUn0MLkZoionJW+Q+bDmlmf42LjMMsURgtFF8nbDTqi
         yC6H8aVfBxzPhdehX6VFTyiOMwYzexEb0NOc8Ayz1LHIRNrPGxMJg4RvCT/Ctsoa+kQj
         ktfA==
X-Forwarded-Encrypted: i=1; AJvYcCWa+7ucewO7T9gvNcc21VD3xx2oJt4X16G6WUxoYm9iI/UvSi/DQKZS+QdQ8wCDG7JS/ojbm5I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzcGLpYue6PC5pRrlUSV+44snBgLNQgfADkQwJXLx3+jfqaTzH
	vN+7bgKsrKj4I+R5I80ovM5rY9DE8PSl6slgZeIGCiSNRrj/VWwtjPpPDE6U4RVI8jyOoDLrGNH
	YOhEw//8BRYISHWu/Sp0hfakeVcY=
X-Gm-Gg: ASbGnct2/IC5P22PjXTwf5bBSXC4v3DbpNFLpX/kaWRV70zNcbaQI/Y+CbGGlLtRiGI
	vZaoulJrhthd4LkSbB0UVf02YAPA5p7QRmpRA
X-Google-Smtp-Source: AGHT+IEBcXj6j3UVSZHDL/otibFrqiFc0eg7Iey+Qp31QVFCMqkK98awPyQfFstWEFBTtT3YfIpDptbUHFWln66vPdE=
X-Received: by 2002:a05:6402:4402:b0:5d3:ba42:e9d5 with SMTP id
 4fb4d7f45d1cf-5d972e06b36mr7194493a12.9.1736460119398; Thu, 09 Jan 2025
 14:01:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501091405.a1fcb1ed-lkp@intel.com> <202501090850.F23EBEBC5B@keescook>
 <202501091236.E3EDA2188@keescook> <pep7tppcmd77ejaa47bhajc3uoy2q2n3cladgc4btdri4mth65@dqjulq2hx4l2>
 <202501091256.4F3B2E8@keescook>
In-Reply-To: <202501091256.4F3B2E8@keescook>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 9 Jan 2025 23:01:47 +0100
X-Gm-Features: AbW1kvZbu9Z69Ril0ATvJrswk7c186FhcLSmmyUnMYPJNqTnJBlTxUBM8DqvV9I
Message-ID: <CAGudoHHymwdk9ChLK=JcPtRD8BSTRDG9B78yOzcRoBGWFzumng@mail.gmail.com>
Subject: Re: [linus:master] [fortify] 239d87327d: vm-scalability.throughput
 17.3% improvement
To: Kees Cook <kees@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nilay Shroff <nilay@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 10:12=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Jan 09, 2025 at 09:52:31PM +0100, Mateusz Guzik wrote:
> > On Thu, Jan 09, 2025 at 12:38:04PM -0800, Kees Cook wrote:
> > > On Thu, Jan 09, 2025 at 08:51:44AM -0800, Kees Cook wrote:
> > > > On Thu, Jan 09, 2025 at 02:57:58PM +0800, kernel test robot wrote:
> > > > > kernel test robot noticed a 17.3% improvement of vm-scalability.t=
hroughput on:
> > > > >
> > > > > commit: 239d87327dcd361b0098038995f8908f3296864f ("fortify: Hide =
run-time copy size from value range tracking")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git m=
aster
> > > >
> > > > Well that is unexpected. There should be no binary output differenc=
e
> > > > with that patch. I will investigate...
> > >
> > > It looks like hiding the size value from GCC has the side-effect of
> > > breaking memcpy inlining in many places. I would expect this to make
> > > things _slower_, though. O_o
>
> I think it's disabling value-range-based inlining, I'm trying to
> construct some tests...
>
> > This depends on what was emitted in place and what CPU is executing it.
> >
> > Notably if gcc elected to emit rep movs{q,b}, the CPU at hand does
> > not have FSRM and the size is low enough, then such code can indeed be
> > slower than suffering a call to memcpy (which does not issue rep mov).
> >
> > I had seen gcc go to great pains to align a buffer for rep movsq even
> > when it was guaranteed to not be necessary for example.
> >
> > Can you disasm an example affected spot?
>
> I tried to find the most self-contained example I could, and I ended up
> with:
>
> static void ipv6_rpl_addr_decompress(struct in6_addr *dst,
>                                      const struct in6_addr *daddr,
>                                      const void *post, unsigned char pfx)
> {
>         memcpy(dst, daddr, pfx);
>         memcpy(&dst->s6_addr[pfx], post, IPV6_PFXTAIL_LEN(pfx));
> }
>

Well I did what I should have from the get go and took the liberty of
looking at the profile.

         %stddev     %change         %stddev
             \          |                \
[snip]
      0.00            +6.5        6.54 =C2=B1 66%
perf-profile.calltrace.cycles-pp.memcpy_orig.copy_page_from_iter_atomic.gen=
eric_perform_write.shmem_file_write_iter.do_iter_readv_writev

Disassembling copy_page_from_iter_atomic *prior* to the change indeed
reveals rep movsq as I suspected (second to last instruction):

<+919>:   mov    (%rax),%rdx
<+922>:   lea    0x8(%rsi),%rdi
<+926>:   and    $0xfffffffffffffff8,%rdi
<+930>:   mov    %rdx,(%rsi)
<+933>:   mov    %r8d,%edx
<+936>:   mov    -0x8(%rax,%rdx,1),%rcx
<+941>:   mov    %rcx,-0x8(%rsi,%rdx,1)
<+946>:   sub    %rdi,%rsi
<+949>:   mov    %rsi,%rdx
<+952>:   sub    %rsi,%rax
<+955>:   lea    (%r8,%rdx,1),%ecx
<+959>:   mov    %rax,%rsi
<+962>:   shr    $0x3,%ecx
<+965>:   rep movsq %ds:(%rsi),%es:(%rdi)
<+968>:   jmp    0xffffffff819157c5 <copy_page_from_iter_atomic+869>

With the reported patch this is a call to memcpy.

This is the guy:
static __always_inline
size_t memcpy_from_iter(void *iter_from, size_t progress,
                        size_t len, void *to, void *priv2)
{
        memcpy(to + progress, iter_from, len);
        return 0;
}

I don't know what the specific bench is doing, I'm assuming passed
values were low enough that the overhead of spinning up rep movsq took
over.

gcc should retain the ability to optimize this, except it needs to be
convinced to not emit rep movsq for variable sizes (and instead call
memcpy).

For user memory access there is a bunch of hackery to inline rep mov
for CPUs where it does not suck for small sizes (see
rep_movs_alternative). Someone(tm) should port it over to memcpy
handling as well.

The expected state would be that for sizes known at compilation time
it rolls with movs as needed (no rep), otherwise emits the magic rep
movs/memcpy invocation, except for when it would be tail-called.

In your ipv6_rpl_addr_decompress example gcc went a little crazy,
which I mentioned does happen. However, most of the time it is doing a
good job instead and a now generated call to memcpy should make things
slower. I presume these spots are merely not being benchmarked here.
Note that going from inline movs (no rep) to a call to memcpy which
does movs (again no rep) comes with a "mere" function call overhead,
which is a different beast than spinning up rep movs on CPUs without
FSRM.

That is to say, contrary to the report above, I believe the change is
in fact a regression which just so happened to make things faster for
a specific case. The unintended speed up can be achieved without
regressing anything else by taming the craziness.

Reading the commit log I don't know what the way out is, perhaps you
could rope in some gcc folk to ask? Screwing with optimization to not
see a warning is definitely not the best option.
--=20
Mateusz Guzik <mjguzik gmail.com>
