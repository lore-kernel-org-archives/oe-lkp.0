Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F3418C10
	for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 11:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="ZS5Dw4UB"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c54c8934abso944111fa.0
        for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 04:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1697627558; x=1698232358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDpHPJE+BkfTNRDkUeRRpPFsjN3yGYmtd1M6xO6lbDg=;
        b=ZS5Dw4UBDxVKOjrGqttHRLGGPRNPLuISYi2hEWsYm6lyiFHrHO+IIMt8ljH6CHB2eY
         +0bXHNEPjnK7NH05MtI3329aryCFSzFIa13yJRfpHgIJqche/2BfphLItzmkKiPLmbLG
         MEoxYBdD09vqoDIa7PvMdRgyQKKYJTf1beKWnrcI5F3QnvEyEI0g7OQZN1py4Vt8tp24
         2f5je5glyVBJrELHu3OQCN1uqxFmw8Dc5aevaTdtftEvwLKv/nNDs6mHS5jKFlu81HCS
         AHPqBh3M1MwAkkPs5YKbpxDj5AAmGf4dLRnc6UmR5/qg9DL+rlLk0jIzJSnLC8GRWQvA
         ja1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697627558; x=1698232358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDpHPJE+BkfTNRDkUeRRpPFsjN3yGYmtd1M6xO6lbDg=;
        b=s8FQKOzb+gVap0m5ve2tg01x1llI4XR6w7StLfCyPWPSz3ZXCDC2oRk3GlS3qe0vx0
         QnBiJu5iUA7gCk5YYM/6JauWhcWdq7iKQiCX03iSWw0AWv66JbPlwgBvIuLGnWWWAliR
         /n5f6IrFbYHigjvkwfBN01LDuHEWBfBF4In539FIEj33IA24k15sHT/LmS7VcdRGQYfz
         z+4UzCT8BgztG1WsBwsZ+qA0mYt2NQrIZmB2697ngyn15oQGWYOLe7hI5bHZARota7LF
         vaGqHa0Ndn/U1ZfAe+Juz39mBgMxTqRbEjKBnUHL8CZKirNWEtsml1T+Vi7tm4IRDgdl
         O99g==
X-Gm-Message-State: AOJu0YwLIKcS29pBAL8c/vqmcm3vLrliGr4RWzakp52bFHKXy0gTYmYZ
	jAG+n7k62inoGTulUmnlGa/VeWKgoTsejaJCFAQ032SWVh/1AX9sj5E=
X-Google-Smtp-Source: AGHT+IEcadxu+rrzOiZNQ2yTDTNJ9ADljxG38fepzRX4LyaanMpNj7OlpP3Lkss3jCyK8vf54Bo72NjI3VENeLXhh0Y=
X-Received: by 2002:a05:651c:503:b0:2c0:c6a:d477 with SMTP id
 o3-20020a05651c050300b002c00c6ad477mr4822094ljp.18.1697627558665; Wed, 18 Oct
 2023 04:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310172247.b9959bd4-oliver.sang@intel.com> <CAKPOu+_T8xk4yd2P4KT4j3eMoFqwYmkxqDHaFtv4Hii5-XyPuA@mail.gmail.com>
In-Reply-To: <CAKPOu+_T8xk4yd2P4KT4j3eMoFqwYmkxqDHaFtv4Hii5-XyPuA@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 18 Oct 2023 13:12:27 +0200
Message-ID: <CAKPOu+87SC1Gk7vgRC4dmBYQ4REqeEq0seFqTwngPSe=z9pn=Q@mail.gmail.com>
Subject: Re: [linux-next:master] [drivers/char/mem] 1b057bd800:
 stress-ng.splice.ops_per_sec -99.8% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 12:21=E2=80=AFPM Max Kellermann
<max.kellermann@ionos.com> wrote:
> I think this might be caused by a bug in stress-ng, leading to
> blocking pipe writes.

Just in case I happen to be right, I've submitted a PR for stress-ng:
https://github.com/ColinIanKing/stress-ng/pull/326
