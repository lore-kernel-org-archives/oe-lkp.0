Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1269718B495
	for <oe-lkp@lists.linux.dev>; Mon, 27 Jan 2025 23:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738020698; cv=none; b=sSXXlaDPLTzsy0l/Hn2/5f8vsOte16g99lViLBZJPsOkOB2c++H4oIb6uFO5d/zXwY7GU83O8HncsXr0Hop9mci/RgQt2LWSgDS9xw3vZN/WwPDRmeaAbt4SgHvaMEX1oaLxvPTPZuWub+dcbKyq2RS5v2qW5jGL6SiXYyTkfjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738020698; c=relaxed/simple;
	bh=QdvEnwBm3WHA0eZGYhCmkCRITu8gts8CSOmECjnksg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVxG+WMCRz/HGMqYjhGx6r3XmUBQCHaZ7zyETie9C40NiGofcjwxMYSQfwZk4CDVGnjaS+H5Emk/Ih8ZLgy1eHMFFmexmFALcs3IDLO6pbpeZYQgX12FQC2yNi21cHwnJu8fEy2JJkXODU/kEBIh1/y9RnGZ5+N3P6pbYgRxOZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcT0kIUd; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcT0kIUd"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a9cdcec53fso36327375ab.1
        for <oe-lkp@lists.linux.dev>; Mon, 27 Jan 2025 15:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738020696; x=1738625496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZOqx/J0Kg6rPZ87QZV09RctWlAEPVfvKjYcnmE4HwE=;
        b=kcT0kIUd9E4dfvPJxbq49duWncyzbrVCxovVVEgO16u3+bhKt23xyTT4s4EqG/4I9t
         UAETJgnLf4HaRTXvTEAbOzx/pel7FeuCmn2F0b8fNg+un9xWLJNHONK6xyoVD5lEd4tR
         fopMar2t+3DYgPsc5gaNQIr2QRVM1JyvCd+eebhmWu5Di2R1va8FsB2Nfw/Qaov/TXuT
         Ht987DjoK5CdRBE++1eb2xK9npkCXUsi79ZvjFfQRZ+mThc/iisRdnqISHveT3IriPA2
         6I73jwPtTjKzw82WaAM/pHWrV1aAa4/m9SO/qWFxm4XYwsn96zEBg0l/O8r/5QrJRyzX
         kImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738020696; x=1738625496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZOqx/J0Kg6rPZ87QZV09RctWlAEPVfvKjYcnmE4HwE=;
        b=Ircy1dV35se+4vlv4bYmaUbjpLHZRz/QX8GveleTQn+RRxCym85DEfP1v0rUX9DAvk
         N1NeVUu5ANdl8r2Ynq8OTVFEj5LBYbOkTjIk7/aE5OJcfB9XFGqVCs8gCVNTlUYBEymU
         JBD/pg2K23iwX2nct1o8bQGv31t2Fyr3Y71QSYDjM7cmf0ZTsoAMF2GeHFc40Jw0flGm
         6GNe59QcLpvut99NEl52b2PNKoArKj6kycepq7MK845C56nXvOjorjjUelr6dL8Mm84d
         405n4q4vKnIliYEG+Grv9sIh3L2UVGbsCyQ9WQ8NtlMpKg1y8XZYsrF4irirhpFkjtxB
         BggQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgIZE1LfZnufRJFSFL2lwwNKazOqIeQnQrLsVdh/FYGA5C6B4PGjBRVlEgUY7EFDZPfFeAEKU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzB/IhvYmAWQC7lgdazOcUSqExRZ+l7ZSO99lbdIIhX7NaAV9E/
	6/P25ydk+MeH8EilhtIGMeg3rE8ZOHDp7k7yI4el14JMMlkGGbGScTpdHy0zVVAVSj24HKu3F6W
	pQ2C5X/HqH76D0SWcJauvDGXQu4g=
X-Gm-Gg: ASbGncv2L+2P+rU+70aP9F7bgA3s27YwgqZVai+eLlvhcflzm/wDzH3S5pVKcHIGkZa
	BeH5m8FYPgMVe9kNel8ZuZ4RKov5UdFSHjxV4cPvu/ywI7yDWcV/zotXeVhWYGA==
X-Google-Smtp-Source: AGHT+IHkVROSrMtvrGqkVRp+DnfGJpy6y2NxGYw+B7VLdsSbgTKsQxmZi5I+AhGuEDOeaWcVYkfuCoamUKI/egKkgZw=
X-Received: by 2002:a05:6e02:3993:b0:3cf:cca4:94f9 with SMTP id
 e9e14a558f8ab-3cfcca49785mr126238985ab.5.1738020696043; Mon, 27 Jan 2025
 15:31:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501261315.c6c7dbb4-lkp@intel.com> <CAL+tcoBBjLsmWUt9PkzDhVtGLm-s53EyTzcHhpTkVnLpgz0FXw@mail.gmail.com>
 <CAL+tcoBmRVKUfhR8DiMryD4h5ZJeQpGuhPyzK3fexiEBvE_KDA@mail.gmail.com> <CADVnQykLL+ZcY0Myg4n0_5PqtOJ9ifxh6nb2VW2txGNDFDF1jg@mail.gmail.com>
In-Reply-To: <CADVnQykLL+ZcY0Myg4n0_5PqtOJ9ifxh6nb2VW2txGNDFDF1jg@mail.gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 28 Jan 2025 07:30:59 +0800
X-Gm-Features: AWEUYZkMM4WJlm5flMtdwfyWqSBI-w-8wlnWd--6HCufXodcclkB1wTsmbIQgI8
Message-ID: <CAL+tcoDP6VCp45dJHWmgbL3W+OxD9-N2J-qUYEKkLSYTMupNzA@mail.gmail.com>
Subject: Re: [linus:master] [tcp_cubic] 25c1a9ca53: packetdrill.packetdrill/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
To: Neal Cardwell <ncardwell@google.com>
Cc: kernel test robot <oliver.sang@intel.com>, Mahdi Arghavani <ma.arghavani@yahoo.com>, 
	oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Haibo Zhang <haibo.zhang@otago.ac.nz>, David Eyers <david.eyers@otago.ac.nz>, 
	Abbas Arghavani <abbas.arghavani@mdu.se>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 11:03=E2=80=AFPM Neal Cardwell <ncardwell@google.co=
m> wrote:
>
> On Mon, Jan 27, 2025 at 5:20=E2=80=AFAM Jason Xing <kerneljasonxing@gmail=
.com> wrote:
> >
> > On Sun, Jan 26, 2025 at 4:49=E2=80=AFPM Jason Xing <kerneljasonxing@gma=
il.com> wrote:
> > >
> > > On Sun, Jan 26, 2025 at 2:30=E2=80=AFPM kernel test robot <oliver.san=
g@intel.com> wrote:
> > > >
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed "packetdrill.packetdrill/gtests/net/tcp/c=
ubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail" on:
> > > >
> > > > (
> > > > in fact, there are other failed cases which can pass on parent:
> > > >
> > > > 4395a44acb15850e 25c1a9ca53db5780757e7f53e68
> > > > ---------------- ---------------------------
> > > >        fail:runs  %reproduction    fail:runs
> > > >            |             |             |
> > > >            :6          100%           6:6     packetdrill.packetdri=
ll/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4-mapped-v6.fail
> > > >            :6          100%           6:6     packetdrill.packetdri=
ll/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv4.fail
> > > >            :6          100%           6:6     packetdrill.packetdri=
ll/gtests/net/tcp/cubic/cubic-bulk-166k-idle-restart_ipv6.fail
> > > >            :6          100%           6:6     packetdrill.packetdri=
ll/gtests/net/tcp/cubic/cubic-bulk-166k_ipv4-mapped-v6.fail
> > > >            :6          100%           6:6     packetdrill.packetdri=
ll/gtests/net/tcp/cubic/cubic-bulk-166k_ipv4.fail
> > > >            :6          100%           6:6     packetdrill.packetdri=
ll/gtests/net/tcp/cubic/cubic-bulk-166k_ipv6.fail
> > >
> > > Thanks for the report. I remembered that Mahdi once modified/adjusted
> > > some of them, please see the link[1].
> > >
> > > [1]: https://lore.kernel.org/all/223960459.607292.1737102176209@mail.=
yahoo.com/
> > >
> > > I think we're supposed to update them altogether?
> >
> > Should the updated pkt scripts target net or net-next tree, BTW?
>
> Those packetdrill scripts are not in the kernel tree yet in "net" or
> "net-next". I suspect they are being pulled from
> https://github.com/google/packetdrill ...
>
> I will try to update those packetdrill scripts ASAP, using Mahdi's
> updates as a starting point.

Thanks, Neal. I can also contribute to it if needed as I've already
started to implement hystart++ one or two days ago (after
communicating with Mahdi Arghavani).

>
> It seems that perhaps we should migrate all the Linux packetdrill
> scripts to the Linux source tree, so we are not in this confusing
> state where some tests are in https://github.com/google/packetdrill
> and some are in the Linux source tree...

Agreed.

Thanks,
Jason
