Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0B1171D
	for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 10:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="L96OM6gi"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c50fbc218bso62716071fa.3
        for <oe-lkp@lists.linux.dev>; Wed, 18 Oct 2023 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1697623317; x=1698228117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gm3UeWzK8TpoHkqcRCHm5SejEBJ+4uqDLzPp4E7NGlE=;
        b=L96OM6gi0g9IrIZO5lKywPocSqzEeZP//hImKUR8l0D2QxtlSsuNEpicGxYSQk1rg0
         FHhE+TyBUILux8hyD4FXjOzMM+PwMhZCaH95tfPrku/cGFodhoNXx+ONhoAptAPh2h0W
         XgpXM4MMCEp7N6vLDQMaO+rxrFVsHpE0ciy3s78zyisDsy1T+ufZBr+lcwRYeWlAfyGb
         h5LzsfE1rUx79dHXlYj7S4c9sFWM2KP/PBp0my40IfEG4Vz8LUEu01+1YmGhJW+aRDbw
         T7quvQXfSKKJKVnvj5pne/aBJx9+vyRP7vFbTjqY+TWfeUM+904R6CDCTB/9v1692D15
         33Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697623317; x=1698228117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm3UeWzK8TpoHkqcRCHm5SejEBJ+4uqDLzPp4E7NGlE=;
        b=qZoeNtWIPlzYvmxi1f/xHZghFlIUgasP/tjx7B9dKhEwehDF4jlNkNd9R954F1RQms
         calntuzTASgLETKfunULCDqzCqHhrrnP9NAYTs8bi2Hrp4JJlhiLJOo5N1LdosOoPR/B
         Khy2NVnA/+bJkapMEWdI3XFFvA+5aiqylfohv1r8XVslR0hbdKPTMvdxunHTRwphTgqR
         3yJGu8rz1nwyu0MFo6AWe8hkgI42o3fuduuC55ai3DNS9Hszc/NDmCwlZHMmFgRxL9jT
         NnJTocKR7H7/ThxlPcY9Gj8CWkXL3HHEm5cGJWlvux4wRF+ZywFfwTeVP6S5wG2IJqTw
         vUXw==
X-Gm-Message-State: AOJu0YwRcjutbaNptaNj6t9o9P+WckTINFfsy3MWl/Qm9vj3g7NWk2Lb
	mkPvfZql1zoGYEt77K57425IavNG4lh4oUojrGdp0HHOP5e8WWLw
X-Google-Smtp-Source: AGHT+IEVIW6QFRaDzHHVooodWsrl0/MQyTjP0WZTlWCzYon7LZ2rIDdVEwwxlKa7291h9eYtxaO3hC0D5xVVI5sk9vQ=
X-Received: by 2002:a05:651c:1989:b0:2bc:dab2:c7dc with SMTP id
 bx9-20020a05651c198900b002bcdab2c7dcmr4347563ljb.47.1697623316974; Wed, 18
 Oct 2023 03:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310172247.b9959bd4-oliver.sang@intel.com> <2023101759-front-ember-6354@gregkh>
 <ZS+EKPJA+BMhM0yO@xsang-OptiPlex-9020>
In-Reply-To: <ZS+EKPJA+BMhM0yO@xsang-OptiPlex-9020>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 18 Oct 2023 12:01:45 +0200
Message-ID: <CAKPOu+8r1QpFUCyMMS04GOi-+HqM7-dxR4JcoLXfvXARobbZDA@mail.gmail.com>
Subject: Re: [linux-next:master] [drivers/char/mem] 1b057bd800:
 stress-ng.splice.ops_per_sec -99.8% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 9:07=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
> it found a (very big) regression comparing to parent commit.
>
> 19e3e6cdfdc73400 1b057bd800c3ea0c926191d7950
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>   12433266           -99.8%      22893 =C4=85  3%  stress-ng.splice.ops_p=
er_sec

Oliver, how is it possible that we have three times the throughput
(MB_per_sec) at 1/500ths the ops?
