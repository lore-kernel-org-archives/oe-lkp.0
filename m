Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C61B17FE0
	for <oe-lkp@lists.linux.dev>; Tue,  9 May 2023 17:05:22 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9660af2499dso794225066b.0
        for <oe-lkp@lists.linux.dev>; Tue, 09 May 2023 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1683651920; x=1686243920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6KbLmm2hGnypwCCIbVWxOS6zbqY1vqAPFYGOOnhtGEc=;
        b=bbqxKfE6Z8EGbjdYkk6sFhSd05uiH5tJeImHDdCystpjFaUROCtvWIh79WfuTmrytB
         0Ctl2dkqGb8FVScb5RZHvTSpPdu8Uyknt7ihFYN6OP1rX7YV/fPX90P5avuRh73kF2mS
         MD9YtNOSS4MgyCsFe6Ujzvdx+MjUtN9C1yYXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683651920; x=1686243920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KbLmm2hGnypwCCIbVWxOS6zbqY1vqAPFYGOOnhtGEc=;
        b=laD1p7X0NFTArGA+mYG0e4PQcCK/DXsZrbgH7j3bt+dmOw47KcjnaYIlAmetWq/zZc
         Ia5pq21r57P9fLm91tZw4oFAFhTpvNo0tPEq4DlvvJ2J2r2PhjS9CcMZCjNjEbGdF/MR
         eE4dGmkKcmCUFUn8FEcXACPLBe5rlrfxlBMnQqK2MqjpLgVtAUQ3KcRtSIbKjTsy7nqv
         OYIjRLXdMM0M1iwh7cFUjjws0gMsEdtbS3zZ374AZGYtlB7hepjRMLis1J6/sfejVP8U
         Brv5W6/svXtp1ceTurZ6UCs1Larq7wVwGht1LAdFP9li++AiD5Ei11mhT+stx0+ElEMt
         ymPA==
X-Gm-Message-State: AC+VfDy8a5+NndgLb+ebrfBptoUlqhma6IVqu8JO/tSWe1Gx4dNOClX6
	yJWqFoJWfQFpzeA6qIaXFVwPCkVZeDn2su1fKQuEcA==
X-Google-Smtp-Source: ACHHUZ4ZthyREQLwR0VM3D6mRAj4gTnO4/XyXwun7XNOaaJUKRPNPjz71MF9yridet5zoXyIAZSB5w==
X-Received: by 2002:a17:906:fd8d:b0:94f:3521:394 with SMTP id xa13-20020a170906fd8d00b0094f35210394mr11629788ejb.51.1683651919951;
        Tue, 09 May 2023 10:05:19 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id d21-20020a170906c21500b00965fdb90801sm1551002ejz.153.2023.05.09.10.05.19
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 10:05:19 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9660af2499dso794219066b.0
        for <oe-lkp@lists.linux.dev>; Tue, 09 May 2023 10:05:19 -0700 (PDT)
X-Received: by 2002:a17:907:169f:b0:953:93ab:50cf with SMTP id
 hc31-20020a170907169f00b0095393ab50cfmr14975532ejc.70.1683651918864; Tue, 09
 May 2023 10:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202305041446.71d46724-yujie.liu@intel.com> <CAHk-=wgYqsXvK0zA0o061NSkc=dXX4LoP_4m41TyskN9RHrojQ@mail.gmail.com>
 <CAHk-=wjMz_=WyfQMx1ebofeq+w6Cr_kRcJ1Xc=D6iKc4My16bQ@mail.gmail.com> <ZFo7j/M1suY/Ey5M@feng-clx>
In-Reply-To: <ZFo7j/M1suY/Ey5M@feng-clx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 May 2023 10:05:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whLZUauRc3skOQGqm3WW4Hr711jHU90dO23ySPFDOFpRA@mail.gmail.com>
Message-ID: <CAHk-=whLZUauRc3skOQGqm3WW4Hr711jHU90dO23ySPFDOFpRA@mail.gmail.com>
Subject: Re: [linus:master] [x86] adfcf4231b: blogbench.read_score -10.9% regression
To: Feng Tang <feng.tang@intel.com>
Cc: kernel test robot <yujie.liu@intel.com>, Frank Denis <j@pureftpd.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 5:30=E2=80=AFAM Feng Tang <feng.tang@intel.com> wrot=
e:
>
> > At a *minimum* that benchmark should have different threads using
> > different read() buffers.
>
> We tried a debug patch which allocates a dedicated buffer for
> each reader thread, run it on the same Cacade Lake platform, and
> the regression is _gone_, after the noise of cache false sharing is
> reduced.

Thanks for verifying.

I was pretty sure that was the issue, but it's always good to
double-check that there wasn't something else going on,

                 Linus
