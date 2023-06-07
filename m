Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93F34D94
	for <oe-lkp@lists.linux.dev>; Wed,  7 Jun 2023 15:40:05 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-62613b2c8b7so76772886d6.1
        for <oe-lkp@lists.linux.dev>; Wed, 07 Jun 2023 08:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686152405; x=1688744405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPv1Cbz/IvioYwuDZ0MkjzKXmpJR4p9JtcCddLmXG5Y=;
        b=RUQQfJP01QbJ3iZeNdhs6bYZLS1UN6NQRIumF1If+O0sqqfu122f3Ral50ruK2LP44
         cDljFnm7NYJuIsbKm1UwEOkPWQG6GqWJLUf6BueVEH4Cm4wTEROAHnnEkhKTblVhyUyZ
         SUP7rdGeCVZCNWNBvnRnNGaCnS3ihnCmhu0jEajvPzJRUqRo2k6IfhSpGMzNTUZR507Q
         lRjywAAsuOcONLmyIowOEYbsOlKVr+UrUMf+trpaBh2RHN20zGJiHTe8l0k8DzRdf1dC
         5Ldf9fkfHmnwTMPExgHQpNOn4EAa7RArVzVqs7HkwJ7l1Y/F/5SDS9/2ECK4v4ks60E1
         4Aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686152405; x=1688744405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPv1Cbz/IvioYwuDZ0MkjzKXmpJR4p9JtcCddLmXG5Y=;
        b=SnnhoFemrmsGc2pOY3Z8nxG+vyALN7VV+2FFNthZUmbisKo/3sTXI1HHKGxySVf0TN
         2Tx2q/6fFapxpaeFiOOPT5ch1dtECuOJ1lo/MA9N41kmnYAi36SxTvePSCvORjfWSZg0
         cyJrOulOzlwJGsfo1lOtWv55ql2WWjm45c8RRCjqytTV+WomSRGG9qd/FP+jgwoozqW8
         7eXKlCjMkbbuLRMd0EVlXzOM9g24AMJzcsDHUq/1dLVcZ31DRy4978o039wNU2RbPwEz
         KKjNcPKxh2WBXIa52xzDADzId7rszTzSMBxQvM7UuhcYJhTA7PTesy72TryK5mw+f4hi
         t04A==
X-Gm-Message-State: AC+VfDwFk8afD+c9MCeTqbUTPlTDl1ADJI6a9krjEJ6MTcA7CXeaEqfq
	uqt1i33zPtDJ1K308ZGfPVgJ1syHv4a1NvGpi/I=
X-Google-Smtp-Source: ACHHUZ4VXos9iLY9AmYRUkSuhaBhqQ9cRtLQoPVi6gMvmn8xwmoMlmNVNaH7vlzsub9a/aeQAKg6i45NP9V36oJ50jw=
X-Received: by 2002:a05:6214:ca7:b0:629:d3c3:f954 with SMTP id
 s7-20020a0562140ca700b00629d3c3f954mr4086254qvs.16.1686152404770; Wed, 07 Jun
 2023 08:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212032038.a5aa4002-oliver.sang@intel.com> <CAOQ4uxj317GyWPbHQiw2-45+xjMvAjEHstEHcJmr_Fmv29xFUw@mail.gmail.com>
 <Y5BKYEF4pB+gIU+l@xsang-OptiPlex-9020> <CAOQ4uxhbmWbKGMPxXA7cwGmt=93XJ9baCNtJM_JJJLsqgKjUVQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxhbmWbKGMPxXA7cwGmt=93XJ9baCNtJM_JJJLsqgKjUVQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 7 Jun 2023 18:39:53 +0300
Message-ID: <CAOQ4uxgFDFkKNMTnPwWzRoXKdpqxD3yOC2XPEbQgEHP+B4ZWRA@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] 95586ea7c5: unixbench.score
 -4.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, kbuild test robot <lkp@intel.com>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2022 at 11:05=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Wed, Dec 7, 2022 at 10:10 AM Oliver Sang <oliver.sang@intel.com> wrote=
:
> >
> > hi Amir,
> >
> > On Mon, Dec 05, 2022 at 06:30:12PM +0200, Amir Goldstein wrote:
> > > On Sat, Dec 3, 2022, 3:06 PM kernel test robot <oliver.sang@intel.com=
>
> > > wrote:
> > >
> > > >
> > > > Greeting,
> > > >
> > > > FYI, we noticed a -4.9% regression of unixbench.score due to commit=
:
> > > >
> > > >
> > > > commit: 95586ea7c597ef4e9712ceb101d03438c1ccde20 ("vfs: prepare for
> > > > pre-modify permission events on write")
> > > > https://github.com/amir73il/linux sb_write_barrier
> > > >
> > >
> > > Hi Oliver,
> > >
> > > I pushed a fixed version for this branch
> > > Can you please re-test?
> >
> > we tested on new branch, found the new commit
> >   91d26357ebf0 ("vfs: prepare for pre-modify permission events on write=
")
> > doesn't cause regression any longer, comparing to its parent.
>
> Great! thanks for the re-test!
>

Hi Oliver,

I have changed the implementation again (to a different optimization)
Could you please re-test branch fan_pre_modify from
https://github.com/amir73il/linux

HEAD commit is:
* 0b234e57df14 - fanotify: introduce FAN_MARK_SYNC flag

The suspect commit (from the original regression report) is now:
* 032fc23e66f8 - vfs: prepare for pre-modify permission events on write

Another commit that was reported as regressing in the past is now:
* 9c5c99716f26 - fanotify: introduce FAN_PRE_MODIFY permission event

There is one commit before it:
* 0611d536174b - fsnotify: optimize the case of no permission marks of any =
type

Which can potentially improve performance compared to upstream master.

Thanks,
Amir.
