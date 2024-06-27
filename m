Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6A7199EA8
	for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719507454; cv=none; b=QuW4lEk91NuH9nS4isNCdk2nqIdEsdwFmVcF87qgRL+sBMQtYthQ6UCbJMyMaaR1lON2QrfiVP1FgflTtD81BbGXMALgtyl50vH8FHD4EvqXkFGMgdHFaFTE0L3WpgPHdhiFpFM9KEwoO6EbKX0rNnHN+s7q/dkrZWrq2/lTqQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719507454; c=relaxed/simple;
	bh=FnYTNd4VoG6yJv0fKqSCNSDjS/xt3cKCDoPqBxS46PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H47phBX93wmHx+2oGetj7lpj7oAFZhrMb4oxEbTXpe5sEIwRvI0mb7x2IpRZcHtMTXGwpDBfEHARNVH1S7xMB2pzjCbAERIqcgz0Kgekt5zAKR6KE9DTARdR5UkEFT0MPeXK1TB9lx2dID+ngE1C4F3wSz9bX1DhyJ8X7TdTQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BQNpg26E; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BQNpg26E"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so8642481fa.0
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 09:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719507450; x=1720112250; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i9kjtJnq6QUCFXqe7TVzsRwtJHG6pu+RYcniY0xGCVQ=;
        b=BQNpg26Exbkq6j+gXr9k8difmDiPU2AoTi83BU7hkjuKwD5iqszMWGrVhzx/t0zV6F
         V+SPPY/wxL8EwVaIcTq1naRCCI6rOlIdIqVRPROEMiGVuqKlAqoG1aZNykoDZjho7TYl
         0xMm4H4QaOk5XM2l4cLw72UMmDYCdCRk9b45M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719507450; x=1720112250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9kjtJnq6QUCFXqe7TVzsRwtJHG6pu+RYcniY0xGCVQ=;
        b=FaYaQvmQePHyFL5Fy0IKQ92DT5EcmRoDEfIXx799ZZvj7jp67lOuV3mjQwS0jmqqKQ
         GBEXIJZFXT+DULVhkfj3VIW4e8Fsp530Bitj7tw6rgC3TtfD+Xw+sofYtg9s92VdeOTv
         HAcSeknIbObFfuukr5jG0bSBK3FIq6CREc+ZMschicRBq/xbgH4hw9w0NwucWrL8CQF7
         m2EDQn4fATCqm8UPEneWxQokS6afHxZNanoR4NUV3sBqIQSOfLdZ10ku2mRareMnI0sk
         yKj4l+MS/zRqXxpruztMAOHJLkLk7qvgs/tsjAGSpFlJR0PJNY++PcQf0QQs4guYrfvb
         gEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiad23VxDkVjQXgu8LbGWXNqRhcwaPF2w/rrJQeAvzpHYwx8QNLQVuFvSHZcbiVYUaqHt8aHkdB7+TN5eLBGEhlVxhCNZb
X-Gm-Message-State: AOJu0YzSON3ZC2hcAzjiS87+wJVre6g/5WDPFrUXWLnXY7P1iBH2USe2
	a9odOmN/umWeWFrRHdXkWR1p2Kyy4/mdN4/LqVm9IDUT1gIyV9ludrBAd7dyUliSAuQSats0kZa
	h723/dA==
X-Google-Smtp-Source: AGHT+IEZgyeXiFL1i8SxRK0pAiLfjMrfTdxKJ7RM5pfVUDuI6RQWZQ4x9bBaoeIkXoJHAvMwXKgp5g==
X-Received: by 2002:a2e:8242:0:b0:2ec:597f:664 with SMTP id 38308e7fff4ca-2ec5b2c4fa1mr102781301fa.2.1719507450582;
        Thu, 27 Jun 2024 09:57:30 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a350e89sm3130611fa.55.2024.06.27.09.57.29
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 09:57:29 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so8642021fa.0
        for <oe-lkp@lists.linux.dev>; Thu, 27 Jun 2024 09:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVY7LYbFD8UfJLRSSinr6C5bmAZTkjcrE9mvpn8FOTQpX00VitS06RxS8txeT+Kld+llylM8ki4PAfKM918jc/bjYHnnKSq
X-Received: by 2002:a2e:6a12:0:b0:2ed:5af6:e846 with SMTP id
 38308e7fff4ca-2ed5af6ea7dmr41715831fa.50.1719507449392; Thu, 27 Jun 2024
 09:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406270912.633e6c61-oliver.sang@intel.com> <CAGudoHF7ys8bTCE0G6vLzEbo+_NyQXmAEEGPJ4hx1yoYmBsoUA@mail.gmail.com>
 <CAGudoHFrMkdo1CoVxJUiEvQ_DyW3hzaCz18GjvLi4ny=o-q9ZQ@mail.gmail.com> <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com>
In-Reply-To: <CAHk-=wg7PXo_QbBo8gv27OpbMgAwLh9H46kJRxAmp0FL0QD7HA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Jun 2024 09:57:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjkn=yL6vy5s7ZFgBfDybD3Gjg9C72zXchy-JF0Tp+a+A@mail.gmail.com>
Message-ID: <CAHk-=wjkn=yL6vy5s7ZFgBfDybD3Gjg9C72zXchy-JF0Tp+a+A@mail.gmail.com>
Subject: Re: [linux-next:master] [lockref] d042dae6ad: unixbench.throughput
 -33.7% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jun 2024 at 09:32, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>   getdent subtest:
>       +4.1   lockref_put_return
>       +5.7   lockref_get_not_dead
>      +68.0   native_queued_spin_lock_slowpath

For this getdents load, the main call chains that terminate in the
queued spinlock case seem to be

.lockref_get_not_dead.__legitimize_path.try_to_unlazy_next.lookup_fast
.lockref_get_not_dead.__legitimize_path.try_to_unlazy.lookup_fast
.lockref_get_not_dead.__legitimize_path.try_to_unlazy.link_path_walk
.dput.terminate_walk.path_openat.do_filp_open

which is interesting because I would have expected the readdir() code
itself to show up.

But the proc_pident_readdir profiles have all gone down, presumably
because there's just much fewer of them. That part shows no spinlock
in the profile at all.

WTH is that benchmark doing? The only readdir that shows up is for
what looks like some /proc filesystem thing.

            Linus
