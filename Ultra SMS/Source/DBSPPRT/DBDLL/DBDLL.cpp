// DBDLL.cpp : ���� DLL �ĳ�ʼ�����̡�
//

#include "stdafx.h"
#include "DBDLL.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

void CompressDB(CString DBName, CString NewDBName, CString Password);
bool FileExists(LPCTSTR lpFileName);
CString AppendPath(CString Path1, CString Path2);

//
//	ע�⣡
//
//		����� DLL ��̬���ӵ� MFC
//		DLL���Ӵ� DLL ������
//		���� MFC ���κκ����ں�������ǰ��
//		��������� AFX_MANAGE_STATE �ꡣ
//
//		����:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// �˴�Ϊ��ͨ������
//		}
//
//		�˺������κ� MFC ����
//		������ÿ��������ʮ����Ҫ������ζ��
//		��������Ϊ�����еĵ�һ�����
//		���֣������������ж������������
//		������Ϊ���ǵĹ��캯���������� MFC
//		DLL ���á�
//
//		�й�������ϸ��Ϣ��
//		����� MFC ����˵�� 33 �� 58��
//

// CDBDLLApp

BEGIN_MESSAGE_MAP(CDBDLLApp, CWinApp)
END_MESSAGE_MAP()


// CDBDLLApp ����

CDBDLLApp::CDBDLLApp()
{
	// TODO: �ڴ˴���ӹ�����룬
	// ��������Ҫ�ĳ�ʼ�������� InitInstance ��
}


// Ψһ��һ�� CDBDLLApp ����

CDBDLLApp theApp;


// CDBDLLApp ��ʼ��

BOOL CDBDLLApp::InitInstance()
{
	CWinApp::InitInstance();

	return TRUE;
}

void CompressDB(CString DBName, CString NewDBName, CString Password)
{
	// ʹ�� DAO ѹ�����ݿ�
	CDaoWorkspace *DBWKS = new CDaoWorkspace;
	
	if (FileExists(NewDBName))
		DeleteFile(NewDBName);
	
	if (Password.IsEmpty())
		DBWKS->CompactDatabase(DBName, NewDBName, _T(""),  0, _T(""));
	else
		DBWKS->CompactDatabase(DBName, NewDBName, _T(""),  0, _T(";pwd=") + Password);

	delete DBWKS;
}

bool FileExists(LPCTSTR lpFileName)
{
	CFileFind ff;

	if (ff.FindFile(lpFileName))
	{
		ff.Close();
		return true;
	}
	else
		return false;
}

CString AppendPath(CString Path1, CString Path2)
{
	if (Path1.Right(1) == _T("\\"))
		return Path1 + Path2;
	else
		return Path1 + _T("\\") + Path2;
}


void WINAPI DBCompress(LPCTSTR lpSrc, LPCTSTR lpDest, LPCTSTR lpPassword)
{
	// ѹ�����ݿ�ĺ���
	char *TmpDir, *TmpFile;

	if (FileExists(lpSrc))
	{	
		if (strlen(lpDest))
			CompressDB(lpSrc, lpDest, lpPassword);
		else
		{
			TmpDir = new char[MAX_PATH];
			TmpFile = new char[MAX_PATH];

			GetTempPath(MAX_PATH, TmpDir);
			GetTempFileName(TmpDir, _T("db"), 0, TmpFile);

			if (strlen(TmpFile))
				CompressDB(lpSrc, TmpFile, lpPassword);

			CopyFile(TmpFile, lpSrc, 0);
			DeleteFile(TmpFile);

			delete [] TmpDir;
			delete [] TmpFile;
		}
	}
}

void WINAPI DBCreate(LPCTSTR lpSrcPath)
{
	CDaoDatabase *db = new CDaoDatabase;
	CDaoQueryDef *sql;

	// ===================
	//  ���� settings.mdb
	// ===================
	DeleteFile(AppendPath(lpSrcPath, _T("settings.mdb")));
	db->Create(AppendPath(lpSrcPath, _T("settings.mdb")));
	db->Execute(_T("CREATE TABLE filter ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Execute(_T("CREATE TABLE interface ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Execute(_T("CREATE TABLE modem ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Execute(_T("CREATE TABLE wnd_print ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Close();
	delete db;
	
	// ==================
	//  ���� contact.mdb
	// ==================

	DeleteFile(AppendPath(lpSrcPath, _T("contact.mdb")));

	db = new CDaoDatabase;
	db->Create(AppendPath(lpSrcPath, _T("contact.mdb")));

	// ���� category ��
	db->Execute(_T(
		"CREATE TABLE [category]\n \
		(\n \
		  [category] VARCHAR(50) PRIMARY KEY\n \
		);"
		));


	// ���� contact ��
	//			CONSTRAINT [pk_cate] FOREIGN KEY ([category]) REFERENCES [category]([category]) ON UPDATE CASCADE ON DELETE CASCADE \

	db->Execute(_T(" \
		CREATE TABLE contact \
		( \
			[id]          LONG NOT NULL, \
			[name]        VARCHAR(14), \
			[category]    VARCHAR(50), \
			[phonenumber] VARCHAR(50) PRIMARY KEY, \
			[folder]      VARCHAR(50) \
		);" 
		));

	// ��������
	db->Execute(_T("CREATE INDEX [id] ON [contact]([id] ASC);"));

	// ������ϵ
	db->CreateRelation(_T("fk_contact"), 
		_T("category"), 
		_T("contact"), 
		dbRelationUpdateCascade | dbRelationDeleteCascade, 
		_T("category"),
		_T("category"));

	db->Close();

	delete db;

	// ==============
	//  ���� sms.mdb
	// ==============
	DeleteFile(AppendPath(lpSrcPath, _T("sms.mdb")));
	db = new CDaoDatabase;
	db->Create(AppendPath(lpSrcPath, _T("sms.mdb")));

	// ���� draft ��
	db->Execute(_T(" \
		CREATE TABLE [draft] \
			( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[content]       MEMO, \
			[date]          DATETIME, \
			[drafttype]     LONG, \
			[associatedbox] VARCHAR(20), \
			[associatedid]  LONG, \
			[hash]			VARCHAR(32) \
		); "
		));

	// ���� draft �������
	db->Execute(_T("CREATE INDEX [id] ON [draft]([id] ASC);"));
	db->Execute(_T("CREATE INDEX [internalid] ON [draft]([internalid] ASC);"));
	db->Execute(_T("CREATE INDEX [date] ON [draft]([date] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [draft]([hash] ASC);"));

	// ���� draft_item ��
	db->Execute(_T(" \
		CREATE TABLE [draft_item] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[associatedid]  LONG, \
			[name]          VARCHAR(50), \
			[number]        VARCHAR(50) \
		);"));

	// ���� draft_item ����
	db->Execute(_T("CREATE INDEX [associatedid] ON [draft_item]([associatedid] ASC);"));

	// ���� draft_item �� draft ��ϵ
	db->CreateRelation(_T("fk_draft"), 
		_T("draft"), 
		_T("draft_item"), 
		dbRelationUpdateCascade | dbRelationDeleteCascade, 
		_T("internalid"),
		_T("associatedid"));

	// ���� finish ��
	db->Execute(_T(" \
		CREATE TABLE [finish] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[senderdate]    DATETIME, \
			[transmitted]   BIT, \
			[content]       MEMO, \
			[hash]			VARCHAR(32) \
		);"));

	// ���� finish ����
	db->Execute(_T("CREATE INDEX [senderdate] ON [finish]([senderdate] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [finish]([hash] ASC);"));

	// ���� finish_item ��
	db->Execute(_T(" \
		CREATE TABLE [finish_item] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[associatedid]  LONG, \
			[name]          VARCHAR(50), \
			[number]        VARCHAR(50) \
		);"));

	// ���� finish_item ����
	db->Execute(_T("CREATE INDEX [associatedid] ON [finish_item]([associatedid] ASC);"));
	db->Execute(_T("CREATE INDEX [number] ON [finish_item]([number] ASC);"));

	// ���� finish_item �� finish ��ϵ
	db->CreateRelation(_T("fk_finish"), 
		_T("finish"), 
		_T("finish_item"), 
		dbRelationUpdateCascade | dbRelationDeleteCascade, 
		_T("internalid"),
		_T("associatedid"));

	// ���� folder ��
	db->Execute(_T(" \
		CREATE TABLE [folder] \
		( \
			[folder]        VARCHAR(50) PRIMARY KEY \
		);"));
	
	// ���� receive ��
	db->Execute(_T(" \
		CREATE TABLE [receive] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[receivedate]   DATETIME, \
			[sender]        VARCHAR(14), \
			[sendernumber]  VARCHAR(50), \
			[replied]       BIT, \
			[read]          BIT, \
			[transmitted]   BIT, \
			[content]       MEMO, \
			[folder]        VARCHAR(50), \
			[hash]			VARCHAR(32) \
		);"));

	// ���� receive ������
	db->Execute(_T("CREATE INDEX [receivedate] ON [receive]([receivedate] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [receive]([hash] ASC);"));

	// ���� send ��
	db->Execute(_T(" \
		CREATE TABLE [send] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[senderdate]    DATETIME, \
			[addressee]     VARCHAR(14), \
			[number]        VARCHAR(50), \
			[content]       MEMO, \
			[finishid]      LONG, \
			[hash]			VARCHAR(32) \
		);"));
	
	// ���� send ������
	db->Execute(_T("CREATE INDEX [senderdate] ON [send]([senderdate] ASC);"));
	db->Execute(_T("CREATE INDEX [finishid] ON [send]([finishid] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [send]([hash] ASC);"));

	// ���� draft_count ��ѯ
	sql = new CDaoQueryDef(db);
	sql->Create(_T("draft_count"), _T(" \
		SELECT draft_item.associatedid AS internalid, count(draft_item.number) AS [count], first(draft_item.name) AS name, first(draft_item.number) AS [number] \
		FROM draft_item \
		GROUP BY draft_item.associatedid;"
		));
	sql->Append();
	sql->Close();
	delete sql;

	// ���� draft_detail ��ѯ
	sql = new CDaoQueryDef(db);
	sql->Create(_T("draft_detail"), _T(" \
		SELECT draft.internalid, draft.id, draft.content, draft.date, draft.drafttype, draft.associatedbox, draft.associatedid, draft_count.count, draft_count.name, draft_count.number \
		FROM draft_count INNER JOIN draft ON draft_count.internalid = draft.internalid; "
		));
	sql->Append();
	sql->Close();
	delete sql;

	// ���� finish_count ��ѯ
	sql = new CDaoQueryDef(db);
	sql->Create(_T("finish_count"), _T(" \
		SELECT finish_item.associatedid AS internalid, Count(*) AS [count], First(finish_item.name) AS name, First(finish_item.number) AS [number] \
		FROM finish_item \
		GROUP BY finish_item.associatedid; "
		));
	sql->Append();
	sql->Close();
	delete sql;

	// ���� finish_detail ��ѯ
	sql = new CDaoQueryDef(db);
	sql->Create(_T("finish_detail"), _T(" \
		SELECT finish.internalid, finish.id, finish.senderdate, finish.transmitted, finish.content, finish_count.count, finish_count.name, finish_count.number \
		FROM finish_count INNER JOIN finish ON finish_count.internalid = finish.internalid; "
		));
	sql->Append();
	sql->Close();
	delete sql;

	// �˳�
	db->Close();
	delete db;
}