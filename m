Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7955D227EAA
	for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741604191; cv=none; b=T2xJMwuWvAiMjGsQ2/OvGl2eXa3hNUnwiBvZsI8VXQUraCo2g6siZj/L70PGhAZgQt/0hH3VSdJ9+M3OSncXcpvNcXwFIflMceDIuanc3AYZ7UnBh0MOMkOIcf7t9W7gzPM0Eutc3gQ2VbF8UXyvL6WrLMO/ETde+4Y1MVFd/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741604191; c=relaxed/simple;
	bh=wGRxKiBJ9FQQRTK6oDzeSg0q1uR8lmPV8PHL2NFq+zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jBjgZcOHtFH05S5iOjhoGffOq/0MfyAUVN3tyxlZgvtNMZX5fnRgXCCM57FaN0RFntBQp57E9ddKwKNBpfo4fEUkd3bQV/EvvTQ9/vs6OCo03oAnau5azi/s4k70SITcj5bBeHpG9ynEAa+jbAj/5RvD/9KdlFv2QmDPEUepktA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iK8+vXC2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iK8+vXC2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912baafc58so2909141f8f.1
        for <oe-lkp@lists.linux.dev>; Mon, 10 Mar 2025 03:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741604188; x=1742208988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGRxKiBJ9FQQRTK6oDzeSg0q1uR8lmPV8PHL2NFq+zA=;
        b=iK8+vXC2j2YXLmlrNTtf0bwfPSEwofRb2qXNR93UUhUxbN8eJG8EqMieFgQsMkSjT+
         cJhnkxM3762gPdtd0/pX/nT6FDRtokUoks22gfkferTCZ5Fv2X2ZhQdZ2ReIwGf8ix/c
         qtBN1rFLOpzW5VlSFjUXP9BdviPm9U9BaOIN/eNOxcgTPM7tNAz15QePGQGKqrgrxCeR
         MtNJECvEZMrDhOrNGyJw7oJDavGCL7ELcAkRNr/Ht3DW3McnUclH0Fd11kZDucJxhl7e
         lYmyNekWyis+Aiu+3hwB0PmfYB1/KfE4Fh1pj6fwPppzO8HrnvSXPpvJDI8opEpLPzCu
         ONMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741604188; x=1742208988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGRxKiBJ9FQQRTK6oDzeSg0q1uR8lmPV8PHL2NFq+zA=;
        b=Puilr206r92pMN53KtSXBSzAL8e2kqgTcggRA+rOUOqpHtyiCtYC85kL6EzbI956gW
         2kwRQUzgABLs1nXNKkUzHAi+jn8moRuygAtbI+U8H+8pi6YuMedzftQWON8nrX7eFHTH
         CNn2HC4ZF2FLxGsGiH5eLW4a2kUBl57Z+8XnJgt7khlL7h3uf7KnW9mX3xzjrFjOlYaP
         U9DXGJ+N6CpOiEVBGM3ndDeycYd5HEhL70sLHEtFJl+SGZGZr5neNYk3jpTSxQTkoOra
         iZ1Tfpxu7BXmyC7d3BHRyilkwu6cZOrtwbRR+Gq7NuoZ5eSWVi8vS9vUD87igySwM6HA
         DXNw==
X-Forwarded-Encrypted: i=1; AJvYcCUFoo7ACtfklXeXnxIttAILBoRTEFaZRZn1VhVWpzltAX3xMioHeG7Cb00tbzXnTpeatLgamac=@lists.linux.dev
X-Gm-Message-State: AOJu0YzyhCYakf5DWed1MQI6Jp6hy13svSEYOiZ159Bv13dSs0qDUX0O
	SKg0xL5rOtUajonQinuu6JGshuvMaDQVzU9eGQhzZzzOsXXkUOU64qLMcDFySr0nEPdknqjhN8q
	I4t2QYx0s9K7w2Z72hKZ/EGXnfZ0=
X-Gm-Gg: ASbGncsEW9c639mncCUFNEUfY1KaeqwAPC5U9GEVc5zFJrVmyIVwwq2cc6Tpa7NJtab
	Y+BFUrCfJDoQkBipq08aWvcffs3sly4Sgxxqc2Kf4kFwECtnzEMGVQI2Ia0rVNQFuH4+TqhInMe
	H/hAHCx+CZjtdfMwCX4ENT6XOHug==
X-Google-Smtp-Source: AGHT+IGYDB/hh4zokMCikpkMPS3SEWZMqEvFe2ojibH66A319Zc73ywxFVPR2jPBB0VrzoRht/KJKUB7T8KTdt9OssE=
X-Received: by 2002:a05:6000:4013:b0:391:3f94:dc9e with SMTP id
 ffacd0b85a97d-3913f94dde0mr5331464f8f.16.1741604187611; Mon, 10 Mar 2025
 03:56:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503101254.cfd454df-lkp@intel.com> <7c41d8d7-7d5a-4c3d-97b3-23642e376ff9@suse.cz>
 <CAADnVQ+NKZtNxS+jBW=tMnmca18S2jfuGCR+ap1bPHYyhxy6HQ@mail.gmail.com> <a30e2c60-e01b-4eac-8a40-e7a73abebfd3@suse.cz>
In-Reply-To: <a30e2c60-e01b-4eac-8a40-e7a73abebfd3@suse.cz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 10 Mar 2025 11:56:16 +0100
X-Gm-Features: AQ5f1JoUrD98AB14rnB1IKdkRt4DsRzn0OxlMkGJPDtUGy7hI_dYyPsJBkJXofA
Message-ID: <CAADnVQ+g=VN6cOVzhF2ory0isXEc52W8fKx4KdwpYfOMvk372A@mail.gmail.com>
Subject: Re: [linux-next:master] [memcg] 01d37228d3: netperf.Throughput_Mbps
 37.9% regression
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>, Alexei Starovoitov <ast@kernel.org>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, Michal Hocko <mhocko@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:34=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 3/10/25 11:18, Alexei Starovoitov wrote:
> >> because this will affect the refill even if consume_stock() fails not =
due to
> >> a trylock failure (which should not be happening), but also just becau=
se the
> >> stock was of a wrong memcg or depleted. So in the nowait context we de=
ny the
> >> refill even if we have the memory. Attached patch could be used to see=
 if it
> >> if fixes things. I'm not sure about the testcases where it doesn't loo=
k like
> >> nowait context would be used though, let's see.
> >
> > Not quite.
> > GFP_NOWAIT includes __GFP_KSWAPD_RECLAIM,
> > so gfpflags_allow_spinning() will return true.
>
> Uh right, it's the new gfpflags_allow_spinning(), not the
> gfpflags_allow_blocking() I'm used to and implicitly assumed, sorry.
>
> But then it's very simple because it has a bug:
> gfpflags_allow_spinning() does
>
> return !(gfp_flags & __GFP_RECLAIM);
>
> should be !!

Ouch.
So I accidentally exposed the whole linux-next to this stress testing
of new trylock facilities :(
But the silver lining is that this is the only thing that blew up :)
Could you send a patch or I will do it later today.
